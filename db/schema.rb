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

ActiveRecord::Schema.define(version: 20170607031654) do

  create_table "posts", force: :cascade do |t|
    t.float "sale_price"
    t.datetime "date_listed"
    t.integer "Product_id"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_posts_on_Product_id"
    t.index ["User_id"], name: "index_posts_on_User_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.integer "User_id"
    t.string "product_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_products_on_User_id"
  end

  create_table "sales", force: :cascade do |t|
    t.float "sale_price"
    t.float "offer_price"
    t.integer "product_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "date_of_birth"
    t.string "password_digest"
    t.string "email"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
