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

ActiveRecord::Schema.define(version: 20170731220414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
    t.index ["event_id"], name: "index_attendees_on_event_id", using: :btree
    t.index ["team_id"], name: "index_attendees_on_team_id", using: :btree
    t.index ["user_id"], name: "index_attendees_on_user_id", using: :btree
  end

  create_table "badges", force: :cascade do |t|
    t.integer "user_id"
    t.string  "message"
    t.integer "sound"
    t.index ["user_id"], name: "index_badges_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "image_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.datetime "starts_at"
    t.datetime "finishes_at"
    t.string   "image_filename"
    t.string   "slug"
    t.text     "label_xml"
    t.boolean  "choose_team",           default: false
    t.boolean  "checkin",               default: false
    t.string   "agenda_image_id"
    t.string   "agenda_image_filename"
    t.boolean  "review"
    t.integer  "location_id"
    t.index ["location_id"], name: "index_events_on_location_id", using: :btree
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "token"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.index ["event_id"], name: "index_invitations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_invitations_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "gmaps_url"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "badge_id"
    t.string   "message"
    t.time     "time"
    t.string   "weekday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_notifications_on_badge_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "image_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image_filename"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.integer  "q_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "individual", default: false, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "stars"
    t.text     "answer"
    t.integer  "question_id"
    t.integer  "reviewee_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
    t.index ["question_id"], name: "index_reviews_on_question_id", using: :btree
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id", using: :btree
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.json     "profiles",   default: {}
    t.index ["event_id"], name: "index_teams_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.integer  "role",             default: 0
    t.integer  "shirt_size",       default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "avatar_id"
    t.bigint   "cellphone"
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "teams"
  add_foreign_key "attendees", "users"
  add_foreign_key "badges", "users"
  add_foreign_key "events", "locations"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users"
  add_foreign_key "notifications", "badges"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "questions"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "teams", "events"
  add_foreign_key "users", "profiles"
end
