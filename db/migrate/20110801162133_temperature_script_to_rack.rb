class TemperatureScriptToRack < ActiveRecord::Migration
  def self.up
    add_column "server_racks", "temperature_script", :text
  end

  def self.down
  end
end
