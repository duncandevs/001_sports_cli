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

ActiveRecord::Schema.define(version: 20170329210619) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_genres", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.text    "first_name"
    t.text    "last_name"
    t.integer "number"
    t.text    "pos"
    t.integer "total_pts"
    t.integer "ppg"
    t.integer "ast"
    t.integer "apg"
    t.integer "reb"
    t.integer "rpg"
    t.integer "to"
    t.integer "topg"
    t.integer "mins"
    t.integer "mpg"
    t.integer "fg"
    t.integer "fg_att"
    t.integer "fg_pct"
    t.integer "fg_3pt_att"
    t.integer "fg_3pt"
    t.integer "fg_3pt_pg"
    t.integer "stl"
    t.integer "spg"
    t.integer "blk"
    t.integer "blk_pg"
    t.integer "pf"
    t.integer "pf_pg"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "date"
    t.string "away_team"
    t.string "home_team"
    t.string "location"
  end

end
