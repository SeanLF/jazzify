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

ActiveRecord::Schema.define(version: 20150210020354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_application_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_applications", force: true do |t|
    t.string   "user_id"
    t.string   "user_application_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_choice_volunteer_position_id"
    t.string   "second_choice_volunteer_position_id"
    t.string   "third_choice_volunteer_position_id"
  end

  create_table "user_informations", force: true do |t|
    t.string   "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "home_phone_number"
    t.string   "work_phone_number"
    t.string   "cell_phone_number"
    t.string   "t_shirt_size"
    t.string   "age_group"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_number"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "availability"
    t.boolean  "code_of_conduct"
    t.string   "unavailability"
  end

  create_table "users", force: true do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "encrypted_otp_secret"
    t.string   "encrypted_otp_secret_iv"
    t.string   "encrypted_otp_secret_salt"
    t.boolean  "otp_required_for_login"
    t.string   "otp_backup_codes",                                    array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteer_positions", force: true do |t|
    t.text     "title",         null: false
    t.text     "objective"
    t.text     "duties"
    t.text     "requirements"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_email"
    t.text     "description",   null: false
  end

end
