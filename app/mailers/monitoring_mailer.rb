class MonitoringMailer < ActionMailer::Base
  default :from => "telmedoff@gmail.com"

    def fail_mail(server,error_msg)
      @server = server    
      @error_msg = error_msg
      mail(:to => @server.contact_email, :subject => "[RapaNui] Server Error: "+@server.name)
    end

    def rack_fail_mail(rack,error_msg)
      @rack = rack    
      @error_msg = error_msg
      mail(:to => @rack.contact_email, :subject => "[RapaNui] Rack Error: "+@rack.name)
    end

    
end
