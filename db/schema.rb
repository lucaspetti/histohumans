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

ActiveRecord::Schema.define(version: 2019_02_04_193559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "flag"
    t.string "photo"
    t.bigint "continent_id"
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "maps", force: :cascade do |t|
    t.integer "year"
    t.string "photo"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_maps_on_country_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id"
    t.string "text"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "occupation"
    t.date "birthdate"
    t.date "death"
    t.text "bio"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["country_id"], name: "index_people_on_country_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.boolean "done"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_quizzes_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "level"
    t.integer "score"
    t.bigint "quiz_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["quiz_id"], name: "index_users_on_quiz_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "countries", "continents"
  add_foreign_key "maps", "countries"
  add_foreign_key "options", "questions"
  add_foreign_key "people", "countries"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "countries"
  add_foreign_key "users", "quizzes"
end
