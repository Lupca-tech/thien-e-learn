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

ActiveRecord::Schema.define(version: 2023_03_05_075427) do

  create_table "chat_messages", force: :cascade do |t|
    t.string "content"
    t.integer "subject_id", null: false
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id", "created_at"], name: "index_chat_messages_on_student_id_and_created_at"
    t.index ["student_id"], name: "index_chat_messages_on_student_id"
    t.index ["subject_id", "created_at"], name: "index_chat_messages_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_chat_messages_on_subject_id"
    t.index ["teacher_id", "created_at"], name: "index_chat_messages_on_teacher_id_and_created_at"
    t.index ["teacher_id"], name: "index_chat_messages_on_teacher_id"
  end

  create_table "countdowns", force: :cascade do |t|
    t.datetime "time"
    t.boolean "status"
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_countdowns_on_student_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"user_id\", \"created_at\"", name: "index_microposts_on_user_id_and_created_at"
    t.index ["teacher_id"], name: "index_microposts_on_teacher_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "date"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subject"
  end

  add_foreign_key "chat_messages", "students"
  add_foreign_key "chat_messages", "subjects"
  add_foreign_key "chat_messages", "teachers"
  add_foreign_key "countdowns", "students"
  add_foreign_key "microposts", "teachers"
end
