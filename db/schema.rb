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

ActiveRecord::Schema.define(version: 20170109004358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "hypothesis"
    t.string   "description"
    t.string   "minutes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_experiments_on_user_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.text     "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experiment_id"
    t.index ["experiment_id"], name: "index_images_on_experiment_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "experiments", "users"
  add_foreign_key "images", "experiments"
end
