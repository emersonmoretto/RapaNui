class ServerRack < ActiveRecord::Base
  
  has_many :servers
      
  validates_presence_of :name, :location
  validates_uniqueness_of :name, :message => "Name is already in use"
    
    def temperature
    
      if( !temperature_script.nil?)
        begin
          eval(temperature_script) #OMG!
        rescue
        end
      end
    end
    
end
