class RenameRack < ActiveRecord::Migration
  def self.up
    remove_column "servers", "rack_id"
    add_column "servers", "server_rack_id", :integer
  end

  def self.down
  end
end
