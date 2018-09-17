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

ActiveRecord::Schema.define(version: 2018_09_17_015513) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "dessert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desserts", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "amount"
    t.string "image"
    t.text "description"
    t.string "location"
    t.string "production_time"
    t.datetime "excess_time"
    t.datetime "pick_time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sold_amount"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "dessert_id"
    t.integer "seller_id"
    t.integer "user_id"
    t.string "name"
    t.string "phone"
    t.integer "amount"
    t.integer "order_price"
    t.string "pick_location"
    t.string "shipping_status", default: "未完成"
    t.string "payment_status"
    t.integer "sn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.integer "dessert_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "avatar"
    t.text "intro"
    t.string "role", default: "general"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "contact_info"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
