require 'net/telnet'

class Server < ActiveRecord::Base
  
  scope :all, order(:name)
  
  belongs_to :type
  belongs_to :server_rack
  belongs_to :operational_system
  belongs_to :depends_from, :class_name => "Server", :foreign_key => "dependent_server_id"
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :ip
  validates_uniqueness_of :ip, :message => "IP address is already in use"
  validates_uniqueness_of :name, :message => "Name is already in use"
  
  validate :monitor_validation

  def monitor_validation
      errors.add(:contact_email, "To monitoring, you need to fill contact e-mail") if (ping_monitor or telnet_monitor) && contact_email.empty?
      errors.add(:ports, "To monitoring, you need to fill the services ports") if (telnet_monitor) && ports.empty?
  end
  
  def ping
    ping = Net::Ping::ICMP.new(self.ip)
    ping_time = Time.now
    ping_alive = ping.ping
    ping_time = (Time.now - ping_time) * 1000.0
  
    return false, "Off" if !ping_alive    
    return true, "#{ ping_time.round(2) } ms"       
  end
  
  
  def telnet (port)
    
    str_result = ""
    begin
      localhost = Net::Telnet::new("Host" => self.ip,
                                   "Port" => port, 
                                   "Timeout" => 7,
                                   "Prompt" => /[$%#>] \z/n)  { |c| str_result +=  c }
                                   
     rescue Errno::ECONNREFUSED
       return false,"Connection Refused!" 
     ensure 
       localhost.close unless localhost.nil?
     end
     
     return false, "Fail" if str_result.index("Connected").nil?
     
     return true, "Connected!"
     
  end
  
   
  
  def ssh(command)
	begin
		result = ""
  	  	Net::SSH.start(self.ip, self.username,:password => self.password, :port => self.ssh_port) do |ssh|
			result = ssh.exec!(command)
		end
		return true, result
	rescue StandardError => bang
		puts bang.inspect
  		return false, "Error : " << bang.inspect
	end	  	
  end
  
  
  def disks

  	str_result = ""
	file_systems = Array.new
 
	result = self.ssh "df"  
	
	if result[0]
		splitted =  result[1].split("\n")
			  splitted.delete_at 0 
			  splitted.each { |line| 
			
				    file_system = line.split(" ")[0]
				    mounted_on  = line[/%.*/][/\/.*/]
				    capacity    = line[/..[0-9]%/]
				    capacity    = capacity[0,capacity.length-1]
				    
				    str_temp = file_system << " (" << mounted_on << ")\t"
				    str_result << str_temp << " " << capacity << "%\n" 
				    file_systems << Hash["file_system" => str_temp, "capacity" => capacity]
			}
		return true, str_result, file_systems	
	else		
		return false, result[1]
	end    
   end
  
  
end
