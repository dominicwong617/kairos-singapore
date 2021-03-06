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

ActiveRecord::Schema.define(version: 20140902144913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id",          null: false
    t.string   "content",          null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "starts_at",   null: false
    t.datetime "ends_at",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue_name"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.integer  "user_id"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "imageable_id",        null: false
    t.string   "imageable_type"
  end

  create_table "project_event_registrations", force: true do |t|
    t.integer  "project_id",                     null: false
    t.integer  "event_id",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      default: "pending", null: false
  end

  create_table "projects", force: true do |t|
    t.string   "title",            null: false
    t.text     "description",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_video_id"
    t.string   "slug"
    t.string   "contact_email"
    t.string   "contact_number"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
    t.string "tag_type"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_event_registrations", force: true do |t|
    t.integer  "user_id",                        null: false
    t.integer  "event_id",                       null: false
    t.string   "state",      default: "pending", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",         default: 0,     null: false
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industries",              default: 0,     null: false
    t.string   "member_type",                             null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username",                                null: false
    t.string   "slug"
    t.string   "job_title"
    t.string   "company"
    t.text     "biography"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                   default: false
    t.boolean  "approved",                default: false
    t.string   "linkedin_url"
    t.integer  "country_id"
    t.integer  "referred_by_id"
    t.integer  "age"
    t.text     "involvement_in_asean"
    t.text     "problem_solving_skills"
    t.text     "contribution_to_society"
    t.text     "leadership_quality"
    t.text     "industry_expertise"
    t.text     "vision"
    t.text     "entrepreneurial"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id",                       null: false
    t.integer  "project_event_registration_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
