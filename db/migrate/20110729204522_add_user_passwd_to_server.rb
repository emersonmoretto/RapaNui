class AddUserPasswdToServer < ActiveRecord::Migration
  def self.up
     add_column "servers", "username", :string
     add_column "servers", "password", :string
  end

  def self.down
  end
end
