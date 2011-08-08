class RemoveModelOs < ActiveRecord::Migration
  def self.up
    remove_column "servers", "model_id"
    add_column "servers", "model", :string
  end

  def self.down
  end
end
