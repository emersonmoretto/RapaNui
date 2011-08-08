class AddDiskMonitoringToServer < ActiveRecord::Migration
  def self.up
  	add_column :servers, :disk_monitor, :boolean
  end

  def self.down
  	remove_column :servers, :disk_monitor
  end
end
