class AddPortsToServer < ActiveRecord::Migration
  def self.up
    add_column :servers, :ports, :text
  end

  def self.down
  end
end
