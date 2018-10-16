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

ActiveRecord::Schema.define(version: 2018_10_16_073324) do

  create_table "categories", force: :cascade do |t|
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "origin_amount"
    t.string "ig_image_url"
    t.integer "category_id"
    t.string "intro_image"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "dessert_id"
    t.integer "user_id"
    t.string "name"
    t.string "phone"
    t.integer "amount"
    t.integer "order_price"
    t.string "pick_location"
    t.string "shipping_status", default: "未完成"
    t.string "payment_status", default: "not_paid"
    t.integer "sn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seller_id"
    t.text "message"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.string "payment_method"
    t.integer "amount"
    t.datetime "paid_at"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sn"
    t.index ["order_id"], name: "index_payments_on_order_id"
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
    t.string "ig_uid"
    t.string "provider"
    t.string "ig_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
