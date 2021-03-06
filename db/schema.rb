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

ActiveRecord::Schema.define(version: 2019_07_27_064443) do

  create_table "books", force: :cascade do |t|
    t.integer "pid"
    t.string "author"
    t.integer "tid"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ranking"
    t.integer "access"
    t.integer "characount"
    t.integer "minutes"
    t.string "cardurl"
  end

  create_table "revues", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["book_id", "created_at"], name: "index_revues_on_book_id_and_created_at"
    t.index ["book_id"], name: "index_revues_on_book_id"
    t.index ["user_id"], name: "index_revues_on_user_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pid"
    t.index ["tid"], name: "index_shelves_on_tid"
    t.index ["user_id", "tid", "pid"], name: "index_shelves_on_user_id_and_tid_and_pid", unique: true
    t.index ["user_id"], name: "index_shelves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
