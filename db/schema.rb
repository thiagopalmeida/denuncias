# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_10_101347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sector"
  end

  create_table "complaint_categories", force: :cascade do |t|
    t.bigint "complaint_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_complaint_categories_on_category_id"
    t.index ["complaint_id"], name: "index_complaint_categories_on_complaint_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.boolean "custom"
    t.string "ni_comp"
    t.integer "year_comp"
    t.string "keep"
    t.text "description"
    t.string "status"
    t.integer "admin_user"
    t.integer "rating"
    t.string "ua"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "complements", force: :cascade do |t|
    t.text "additional_information"
    t.bigint "complaint_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["complaint_id"], name: "index_complements_on_complaint_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "cpf"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "complaint_categories", "categories"
  add_foreign_key "complaint_categories", "complaints"
  add_foreign_key "complaints", "users"
  add_foreign_key "complaints", "users", column: "admin_user"
  add_foreign_key "complements", "complaints"
end
