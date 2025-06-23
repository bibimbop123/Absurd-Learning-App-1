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

ActiveRecord::Schema[8.0].define(version: 2025_03_13_202314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "absurd_stories", force: :cascade do |t|
    t.bigint "learning_concept_id", null: false
    t.bigint "absurd_theme_id", null: false
    t.text "story_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["absurd_theme_id"], name: "index_absurd_stories_on_absurd_theme_id"
    t.index ["learning_concept_id"], name: "index_absurd_stories_on_learning_concept_id"
  end

  create_table "absurd_themes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_concepts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "absurd_stories", "absurd_themes"
  add_foreign_key "absurd_stories", "learning_concepts"
end
