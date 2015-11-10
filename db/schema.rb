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

ActiveRecord::Schema.define(version: 20151101130923) do

  create_table "appointments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.string   "purpose"
    t.string   "result"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "appointment_date"
  end

  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "diagnoses", force: true do |t|
    t.text     "content"
    t.integer  "patient_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnoses", ["patient_id"], name: "index_diagnoses_on_patient_id", using: :btree
  add_index "diagnoses", ["user_id"], name: "index_diagnoses_on_user_id", using: :btree

  create_table "information", force: true do |t|
    t.integer  "patient_id"
    t.string   "religion"
    t.string   "status"
    t.string   "sex"
    t.integer  "age"
    t.date     "bday"
    t.string   "height"
    t.string   "weight"
    t.string   "homephone"
    t.string   "businessphone"
    t.string   "mobilephone"
    t.string   "email"
    t.string   "occupation"
    t.string   "spouse"
    t.string   "referredby"
    t.datetime "dps"
  end

  add_index "information", ["patient_id"], name: "index_information_on_patient_id", using: :btree

  create_table "patients", force: true do |t|
    t.string   "lname"
    t.string   "fname"
    t.string   "mi"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "statistics", force: true do |t|
    t.integer  "patient_id"
    t.integer  "appointment_id"
    t.string   "bp"
    t.decimal  "weight",         precision: 10, scale: 0
    t.decimal  "height",         precision: 10, scale: 0
    t.datetime "date_gathered"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "statistics", ["appointment_id"], name: "index_statistics_on_appointment_id", unique: true, using: :btree
  add_index "statistics", ["patient_id"], name: "index_statistics_on_patient_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "username"
    t.string   "role"
    t.integer  "patient_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "views", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true, using: :btree
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true, using: :btree

end
