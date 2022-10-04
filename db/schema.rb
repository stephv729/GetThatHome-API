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

ActiveRecord::Schema[7.0].define(version: 2022_10_04_162822) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.text "references"
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ownable_type", null: false
    t.bigint "ownable_id", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_owns_on_ownable"
    t.index ["user_id"], name: "index_owns_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "property_type_id", null: false
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "area"
    t.text "description"
    t.text "photo_urls", default: [], array: true
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_properties_on_address_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_for_rents", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.integer "monthly_rent", null: false
    t.integer "maintenance", null: false
    t.boolean "pets_allowed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_for_rents_on_property_id"
  end

  create_table "property_for_sales", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_for_sales_on_property_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.boolean "favorite"
    t.boolean "contacted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_saved_properties_on_property_id"
    t.index ["user_id"], name: "index_saved_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "password"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "owns", "users"
  add_foreign_key "properties", "addresses"
  add_foreign_key "properties", "property_types"
  add_foreign_key "property_for_rents", "properties"
  add_foreign_key "property_for_sales", "properties"
  add_foreign_key "saved_properties", "properties"
  add_foreign_key "saved_properties", "users"
  add_foreign_key "users", "roles"
end
