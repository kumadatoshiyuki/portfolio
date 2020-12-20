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

ActiveRecord::Schema.define(version: 2020_12_19_084246) do

  create_table "admin_notes", force: :cascade do |t|
    t.float "body_temperature"
    t.time "sleep_start"
    t.time "sleep_end"
    t.string "message"
    t.integer "creator_id"
    t.date "record_date"
    t.integer "user_id"
    t.integer "staple_food_amount_id"
    t.integer "main_dish_amount_id"
    t.integer "side_dish_amount_id"
    t.integer "fruit_amount_id"
    t.integer "timestamps"
    t.integer "soup_amount_id"
    t.integer "number_toilet"
    t.index ["fruit_amount_id"], name: "index_admin_notes_on_fruit_amount_id"
    t.index ["main_dish_amount_id"], name: "index_admin_notes_on_main_dish_amount_id"
    t.index ["side_dish_amount_id"], name: "index_admin_notes_on_side_dish_amount_id"
    t.index ["soup_amount_id"], name: "index_admin_notes_on_soup_amount_id"
    t.index ["staple_food_amount_id"], name: "index_admin_notes_on_staple_food_amount_id"
    t.index ["user_id"], name: "index_admin_notes_on_user_id"
  end

  create_table "affiliation_news", force: :cascade do |t|
    t.integer "affiliation_id"
    t.integer "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_affiliation_news_on_affiliation_id"
    t.index ["news_id"], name: "index_affiliation_news_on_news_id"
  end

  create_table "affiliations", force: :cascade do |t|
    t.string "affiliation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amounts", force: :cascade do |t|
    t.string "amount_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "staple_food"
    t.string "main_dish"
    t.string "side_dish"
    t.string "fruit"
    t.date "record_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "soup"
  end

  create_table "news", force: :cascade do |t|
    t.string "message"
    t.datetime "creation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toilet_times", force: :cascade do |t|
    t.datetime "toilet_time"
    t.integer "toilet_type_id"
    t.integer "admin_note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_note_id"], name: "index_toilet_times_on_admin_note_id"
    t.index ["toilet_type_id"], name: "index_toilet_times_on_toilet_type_id"
  end

  create_table "toilet_types", force: :cascade do |t|
    t.string "toilet_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_notes", force: :cascade do |t|
    t.float "body_temperature"
    t.integer "number_toilet"
    t.time "sleep_start"
    t.time "sleep_end"
    t.string "breakfast"
    t.string "dinner"
    t.string "message"
    t.date "record_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attendance_confirmation"
    t.index ["user_id"], name: "index_user_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "kana_first_name", null: false
    t.string "kana_last_name", null: false
    t.integer "age", null: false
    t.integer "phone", null: false
    t.string "image_id"
    t.boolean "is_valid", default: true, null: false
    t.string "login_id", null: false
    t.string "email", default: "", null: false
    t.integer "affiliation_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1, null: false
    t.index ["affiliation_id"], name: "index_users_on_affiliation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
