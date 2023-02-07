# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_07_192344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
  end

  create_table "callings", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "callings_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "calling_id", null: false
  end

  create_table "congregation_responsibilities", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "congregation_responsibilities_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "congregation_responsibility_id", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
  end

  create_table "interest_categories", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "interest_category_id", null: false
    t.index ["interest_category_id"], name: "index_interests_on_interest_category_id"
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "interest_id", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like_other_id"
    t.integer "liked_by_other_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_settings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "age_range_min"
    t.integer "age_range_max"
    t.float "distance_radius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_search_settings_on_user_id"
  end

  create_table "spiritual_gifts", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spiritual_gifts_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spiritual_gift_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.integer "gender"
    t.point "location"
    t.float "longitude"
    t.float "latitude"
    t.date "last_active", default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "verified_user", default: false
    t.boolean "verified_congregation", default: false
    t.boolean "verified_rebirth", default: false
    t.boolean "is_active", default: false
    t.text "bio"
    t.float "distance_radius", default: 5.0
    t.boolean "limit_contact_to_age_range", default: false
    t.string "marital_status"
    t.string "height"
    t.string "body_type"
    t.integer "weight"
    t.string "eye_color"
    t.string "tattoos", default: "{}"
    t.string "education"
    t.integer "income_amount"
    t.string "income_currency"
    t.string "economy_status"
    t.string "work_status"
    t.string "attendance_frequency"
    t.string "tithing_status"
    t.string "alms_status"
    t.date "rebirth_date"
    t.string "prayer_frequency"
    t.integer "number_of_times_read_bible"
    t.string "smoke_status"
    t.string "sober_status"
    t.string "caffeine_status"
    t.string "drug_status"
    t.string "medical_status"
    t.string "diet"
    t.string "allergies", default: [], array: true
    t.string "exercise"
    t.boolean "children_status"
    t.string "wants_children"
    t.boolean "pets_status"
    t.boolean "wants_pets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age_range_lower", default: 18
    t.integer "age_range_upper", default: 99
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_work_sectors", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_sector_id", null: false
  end

  create_table "work_sectors", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interests", "interest_categories"
end
