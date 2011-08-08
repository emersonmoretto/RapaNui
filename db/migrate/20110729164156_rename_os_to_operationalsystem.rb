class RenameOsToOperationalsystem < ActiveRecord::Migration
  def self.up
    remove_column "servers", "os_id"
    add_column "servers", "operational_system_id", :integer
  end

  def self.down
  end
end
