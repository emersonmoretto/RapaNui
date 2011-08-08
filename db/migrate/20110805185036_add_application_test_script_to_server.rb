class AddApplicationTestScriptToServer < ActiveRecord::Migration
  def self.up
    add_column "servers", "application_test_script", :text
  end

  def self.down
  	remove_column "servers", "application_test_script"
  end
end
