class AddSshPortToServer < ActiveRecord::Migration
  def self.up
    add_column "servers", "ssh_port", :integer
  end

  def self.down
  end
end
