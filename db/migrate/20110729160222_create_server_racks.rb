class CreateServerRacks < ActiveRecord::Migration
  def self.up
    create_table :server_racks do |t|
      t.string :name
      t.string :location
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :server_racks
  end
end
