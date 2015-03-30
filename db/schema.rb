# This file is auto-generated from the current state of the database. Instead of editing this file,
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150327211647) do

  create_table "bracket_nodes", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "team_id"
    t.boolean  "win"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "depth"
    t.integer  "pts"
    t.boolean  "is_test"
  end

  create_table "brackets", :force => true do |t|
    t.string   "bracket_name"
    t.integer  "user_id"
    t.boolean  "is_template"
    t.integer  "bracket_node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_pts"
    t.integer  "possible_pts"
  end

  create_table "scenarios", :force => true do |t|
    t.string   "round_of_1_ids",  :limit => nil
    t.string   "round_of_2_ids",  :limit => nil
    t.string   "round_of_4_ids",  :limit => nil
    t.string   "round_of_8_ids",  :limit => nil
    t.string   "round_of_16_ids", :limit => nil
    t.string   "round_of_32_ids", :limit => nil
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "team_name"
    t.integer  "seed"
    t.string   "region"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_alive",   :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
