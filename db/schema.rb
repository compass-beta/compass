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

ActiveRecord::Schema.define(version: 20171108070229) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title"
    t.string   "city"
    t.string   "country"
    t.string   "address"
    t.float    "latitude",       limit: 24,                             comment: "緯度"
    t.float    "longitude",      limit: 24,                             comment: "経度"
    t.string   "txt_file_url"
    t.string   "eye_catch_url"
    t.string   "img_file_url_1"
    t.string   "img_file_url_2"
    t.string   "img_file_url_3"
    t.string   "img_file_url_4"
    t.string   "img_file_url_5"
    t.boolean  "show_flag",                 default: true,              comment: "true: 表示, false: 非表示"
    t.integer  "card_type",                 default: 0,                 comment: "0: なし, 1: 場所, 2: ニュース, 3: コラム, 4: 記事, 5: イベント, 6: ツアー"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "city"
    t.string   "city_en"
    t.string   "country"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.json     "interest_json"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "job"
    t.string   "job_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "occupation"
    t.string   "occupation_en"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "preferences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "occupation_id"
    t.integer  "job_id"
    t.integer  "interest_id"
    t.string   "start_trip_day"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tag_to_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "card_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "tag_name"
    t.string   "vector_coord"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
