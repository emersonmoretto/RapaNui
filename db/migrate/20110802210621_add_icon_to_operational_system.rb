class AddIconToOperationalSystem < ActiveRecord::Migration
  def self.up
    add_column :operational_systems, :avatar_file_name,    :string
    add_column :operational_systems, :avatar_content_type, :string
    add_column :operational_systems, :avatar_file_size,    :integer
    add_column :operational_systems, :avatar_updated_at,   :datetime
  end

  def self.down
  end
end
