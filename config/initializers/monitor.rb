
# Monitor Thread
$monitor = Thread.new{ 
  
  puts "=> Monitor thread starting up"
  sleep 7  
    
  while true do

	
	
	ServerRack.find(:all).each do |rack|
		if rack.temperature_monitor
			temperature = rack.temperature[/\d\d/]
			temperature = Integer(temperature)
			if temperature > $rack_temperature_threshold
			    msg = "Rack is HOT  ( " << temperature.to_s << " degrees Celsius ) "
			    puts msg
				MonitoringMailer.rack_fail_mail(rack, msg).deliver
          		puts "Fail #{rack.name}. Mail sent"
			end
		end
	end
	
	
	

    Server.find(:all).each do |server|
    
      #Ping monitoring
      if server.ping_monitor      
        if !server.ping[0]
          MonitoringMailer.fail_mail(server, "Ping fail").deliver
          puts "Fail #{server.name}. Mail sent"
        end      
      end


      #Disk monitoring
      if server.disk_monitor     
        result = server.disks
        
        if !result[0]
          MonitoringMailer.fail_mail(server, "Could not get Disk Information").deliver
          puts result[1]
          puts "Fail #{server.name}. Could Not get Disk Information. Mail sent. "
        else
          file_systems = result[2]
          full_msg = ""
          file_systems.each { |partition|
          	if Integer(partition["capacity"]) > $disk_threshold
          	   full_msg << "  Partition #{partition["file_system"]} is #{partition["capacity"]}% full.\n"
          	end
          }
          if !full_msg.empty?
            MonitoringMailer.fail_mail(server, "Disk Full \n " << full_msg ).deliver
            puts "Fail #{server.name}. Disk full. Mail sent"            
            puts full_msg
          end
        end      
      end
      
      
      #Telnet monitoring
      if server.telnet_monitor      
        errors = ""
        
        server.ports.split(" ").each do |port| #for each service
          serv =  port.split(":")[0] 
          port = port.split(":")[1]
          
          test = server.telnet(port) #doing the telnet test          
          errors += " #{serv}@#{port}: #{test[1]} <br/>" if !test[0]  #getting error if test fail            
        end
        
        if !errors.empty?
          MonitoringMailer.fail_mail(server, errors).deliver
          puts "Fail #{server.name}. Mail sent"
        end      
      end
      
    end
    
    sleep $monitor_sleep         
    
  end  
}