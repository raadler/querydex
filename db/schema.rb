# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170627171633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemons", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "species",                        null: false
    t.integer  "gen_id",                         null: false
    t.integer  "ndex",                           null: false
    t.float    "height",                         null: false
    t.float    "weight",                         null: false
    t.integer  "gender_rate",                    null: false
    t.integer  "catch_rate",                     null: false
    t.integer  "exp_yield",                      null: false
    t.integer  "base_happiness",                 null: false
    t.integer  "egg_group1",                     null: false
    t.integer  "egg_group2"
    t.boolean  "is_baby",        default: false, null: false
    t.integer  "hatch_counter",                  null: false
    t.integer  "lvl_100_exp",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_1_id"
    t.integer  "type_2_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
  end

end
