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

ActiveRecord::Schema.define(version: 20160906142831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "chat_id"
  end

  create_table "message_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["message_id"], name: "index_message_users_on_message_id", using: :btree
    t.index ["user_id"], name: "index_message_users_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "chat_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "messages", "chats"
end
