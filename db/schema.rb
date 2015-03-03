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

ActiveRecord::Schema.define(version: 20150218230525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_application_statuses", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_applications", force: :cascade do |t|
    t.string   "user_id",                             limit: 255
    t.string   "user_application_status_id",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_choice_volunteer_position_id",  limit: 255
    t.string   "second_choice_volunteer_position_id", limit: 255
    t.string   "third_choice_volunteer_position_id",  limit: 255
  end

  create_table "user_informations", force: :cascade do |t|
    t.string   "user_id",                  limit: 255
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.string   "address",                  limit: 255
    t.string   "city",                     limit: 255
    t.string   "province",                 limit: 255
    t.string   "postal_code",              limit: 255
    t.string   "home_phone_number",        limit: 255
    t.string   "work_phone_number",        limit: 255
    t.string   "cell_phone_number",        limit: 255
    t.string   "t_shirt_size",             limit: 255
    t.string   "age_group",                limit: 255
    t.string   "emergency_contact_name",   limit: 255
    t.string   "emergency_contact_number", limit: 255
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "availability",             limit: 255
    t.boolean  "code_of_conduct"
    t.string   "unavailability",           limit: 255
    t.integer  "updated_by"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     limit: 255, default: "", null: false
    t.string   "encrypted_password",        limit: 255, default: "", null: false
    t.string   "reset_password_token",      limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "encrypted_otp_secret",      limit: 255
    t.string   "encrypted_otp_secret_iv",   limit: 255
    t.string   "encrypted_otp_secret_salt", limit: 255
    t.boolean  "otp_required_for_login"
    t.string   "otp_backup_codes",                                                array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteer_positions", force: :cascade do |t|
    t.text     "title",                     null: false
    t.text     "objective"
    t.text     "duties"
    t.text     "requirements"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_email", limit: 255
    t.text     "description",               null: false
  end

end
