class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :name
      t.text :desc
      t.integer :type_id
      t.integer :rack_id
      t.string :ip
      t.boolean :alive
      t.string :os_id
      t.string :contact
      t.string :contact_email
      t.text :hw_specs
      t.string :visible_label
      t.integer :model_id
      t.date :warranty_expiration
      t.string :serial_number

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
