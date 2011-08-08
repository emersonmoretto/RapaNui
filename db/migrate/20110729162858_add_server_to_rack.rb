class AddServerToRack < ActiveRecord::Migration
  def self.up
    add_column "server_racks", "server_id", :integer
  end

  def self.down
  end
end
