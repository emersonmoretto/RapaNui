class CreateOperationalSystems < ActiveRecord::Migration
  def self.up
    create_table :operational_systems do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :operational_systems
  end
end
