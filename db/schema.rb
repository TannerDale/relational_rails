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

ActiveRecord::Schema.define(version: 2021_08_23_214929) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "characters", force: :cascade do |t|
    t.bigint "video_game_id"
    t.string "name"
    t.integer "age"
    t.boolean "human"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_game_id"], name: "index_characters_on_video_game_id"
  end

  create_table "video_games", force: :cascade do |t|
    t.string "name"
    t.integer "campaign_hours"
    t.boolean "multiplayer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  create_table "books", force: :cascade do |t|
    t.bigint "library_id"
    t.string "title"
    t.string "author_surname"
    t.boolean "nonfiction"
    t.integer "year_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.integer "employees"
    t.boolean "open_weekends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters", "video_games"
  add_foreign_key "books", "libraries"

end
