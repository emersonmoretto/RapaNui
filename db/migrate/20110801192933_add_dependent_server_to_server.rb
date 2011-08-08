class AddDependentServerToServer < ActiveRecord::Migration
  def self.up    
      add_column :servers, :dependent_server_id, :string
  end

  def self.down
  end
end
