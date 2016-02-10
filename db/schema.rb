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

ActiveRecord::Schema.define(version: 20160210054516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.string   "address"
    t.integer  "min_age"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parties", ["user_id"], name: "index_parties_on_user_id", using: :btree

  create_table "parties_users", id: false, force: :cascade do |t|
    t.integer "party_id"
    t.integer "user_id"
  end

  add_index "parties_users", ["party_id"], name: "index_parties_users_on_party_id", using: :btree
  add_index "parties_users", ["user_id"], name: "index_parties_users_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.string   "location"
    t.string   "gender"
    t.string   "about"
    t.boolean  "host"
    t.boolean  "guest"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "active",                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.integer  "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "parties", "users"
  add_foreign_key "profiles", "users"
end