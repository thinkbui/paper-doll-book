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

ActiveRecord::Schema.define(version: 2020_07_07_082417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "layers", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "page_id"
    t.string "iid", null: false
    t.string "name", null: false
    t.integer "controls"
    t.boolean "display"
    t.integer "current"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_layers_on_book_id"
    t.index ["page_id"], name: "index_layers_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.integer "order"
    t.string "type"
    t.string "name", null: false
    t.text "src"
    t.integer "z_index"
    t.bigint "layer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_pages_on_book_id"
    t.index ["layer_id"], name: "index_pages_on_layer_id"
  end

  add_foreign_key "layers", "books"
  add_foreign_key "layers", "pages"
  add_foreign_key "pages", "books"
  add_foreign_key "pages", "layers"
end
