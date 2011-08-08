# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110805185036) do

  create_table "operational_systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "os", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "server_racks", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "server_id"
    t.text     "temperature_script"
    t.boolean  "temperature_monitor"
    t.string   "contact_email"
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "type_id"
    t.string   "ip"
    t.boolean  "alive"
    t.string   "contact"
    t.string   "contact_email"
    t.text     "hw_specs"
    t.string   "visible_label"
    t.date     "warranty_expiration"
    t.string   "serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "server_rack_id"
    t.string   "model"
    t.integer  "operational_system_id"
    t.integer  "ssh_port"
    t.string   "username"
    t.string   "password"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "dependent_server_id"
    t.text     "ports"
    t.boolean  "telnet_monitor"
    t.boolean  "ping_monitor"
    t.boolean  "disk_monitor"
    t.text     "application_test_script"
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
