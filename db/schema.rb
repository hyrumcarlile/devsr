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

ActiveRecord::Schema.define(version: 20180117140941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "endorsements", force: :cascade do |t|
    t.integer  "endorser_id"
    t.integer  "endorsee_id"
    t.integer  "skill_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.decimal  "endorsement_value", precision: 10, scale: 5, default: "0.0"
    t.index ["endorsee_id"], name: "index_endorsements_on_endorsee_id", using: :btree
    t.index ["endorser_id", "endorsee_id", "skill_id"], name: "index_endorsements_on_endorser_id_and_endorsee_id_and_skill_id", unique: true, using: :btree
    t.index ["endorser_id"], name: "index_endorsements_on_endorser_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body"
    t.text     "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.text     "image_url"
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "simulated_days", force: :cascade do |t|
    t.integer  "num_new_users"
    t.integer  "num_new_endorsements"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "skill_ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.decimal  "rating",     precision: 15, scale: 5, default: "0.0"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["skill_id"], name: "index_skill_ratings_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_skill_ratings_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "email",                                           default: "",    null: false
    t.string   "encrypted_password",                              default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.decimal  "rating",                 precision: 15, scale: 5, default: "0.0"
    t.text     "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "notes", "users"
  add_foreign_key "skill_ratings", "skills"
  add_foreign_key "skill_ratings", "users"
end
