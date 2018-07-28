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

ActiveRecord::Schema.define(version: 20180728175439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievement_criteria", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "consecutive_logins"
    t.datetime "last_login"
    t.boolean  "has_founder"
    t.boolean  "has_lightbulb"
    t.boolean  "has_pest_control"
    t.boolean  "has_lifesaver"
    t.boolean  "has_party_parrot"
    t.boolean  "has_party_corgi"
    t.boolean  "has_party_wizard"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_achievement_criteria_on_user_id", using: :btree
  end

  create_table "achievements", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "icon_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "achievements_users", id: false, force: :cascade do |t|
    t.integer "achievement_id", null: false
    t.integer "user_id",        null: false
    t.index ["achievement_id", "user_id"], name: "index_achievements_users_on_achievement_id_and_user_id", unique: true, using: :btree
    t.index ["user_id", "achievement_id"], name: "index_achievements_users_on_user_id_and_achievement_id", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "note_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_comments_on_note_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "endorsements", force: :cascade do |t|
    t.integer  "endorser_id"
    t.integer  "endorsee_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.decimal  "endorsement_value", precision: 10, scale: 5, default: "0.0"
    t.integer  "skill_id"
    t.index ["endorsee_id"], name: "index_endorsements_on_endorsee_id", using: :btree
    t.index ["endorser_id"], name: "index_endorsements_on_endorser_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body"
    t.text     "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.text     "image_url"
    t.string   "slug"
    t.boolean  "comments_disabled"
    t.text     "subtitle"
    t.boolean  "is_private"
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "simulated_days", force: :cascade do |t|
    t.integer  "num_new_users"
    t.integer  "num_new_endorsements"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "num_new_notes"
    t.integer  "num_new_votes"
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
    t.string   "provider"
    t.string   "uid"
    t.integer  "role",                                            default: 0
    t.integer  "number_of_sign_ins",                              default: 0
    t.string   "slug"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "is_upvote?"
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "achievement_criteria", "users"
  add_foreign_key "comments", "notes"
  add_foreign_key "comments", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "skill_ratings", "skills"
  add_foreign_key "skill_ratings", "users"
end
