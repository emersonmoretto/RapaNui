class AddMonitoringToServers < ActiveRecord::Migration
  def self.up
    add_column :servers, :telnet_monitor, :boolean
    add_column :servers, :ping_monitor, :boolean
  end

  def self.down
  end
end
