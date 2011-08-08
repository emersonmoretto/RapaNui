class AddMonitoringToServerRack < ActiveRecord::Migration
  def self.up
      add_column :server_racks, :temperature_monitor, :boolean
      add_column :server_racks, :contact_email, :string
  end

  def self.down  	
     remove_column :server_racks, :temperature_monitor
     remove_column :server_racks, :contact_email
  end
end
