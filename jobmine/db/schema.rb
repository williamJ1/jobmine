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

ActiveRecord::Schema.define(version: 20171203192501) do

  create_table "contracts", force: :cascade do |t|
    t.integer "accept_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.integer "job_id"
    t.index ["job_id"], name: "index_contracts_on_job_id"
    t.index ["profile_id"], name: "index_contracts_on_profile_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "begin_date_time"
    t.datetime "end_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.float "hour_rate"
    t.integer "profile_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["profile_id"], name: "index_jobs_on_profile_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "card_num"
    t.string "card_holder_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_payments_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "address"
    t.string "phone_num"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "user_type"
    t.float "latitude"
    t.float "longitude"
    t.decimal "average_rating", default: "-1.0"
    t.integer "rating_star", default: 0
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "rating"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "reviewer"
    t.integer "contract_id"
    t.integer "reviewer_id"
    t.string "title"
    t.index ["contract_id"], name: "index_reviews_on_contract_id"
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "date_time_begin"
    t.integer "time_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contract_id"
    t.integer "approve_status"
    t.datetime "paid_time"
    t.index ["contract_id"], name: "index_timeslots_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
