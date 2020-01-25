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

ActiveRecord::Schema.define(version: 2020_01_25_074513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homework_markings", force: :cascade do |t|
    t.string "mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id", null: false
    t.bigint "homework_id", null: false
    t.bigint "homework_question_id", null: false
    t.index ["homework_id", "homework_question_id", "student_id"], name: "idx_homeworkid_homeworkquestionid_studentid"
    t.index ["homework_id"], name: "index_homework_markings_on_homework_id"
    t.index ["homework_question_id"], name: "index_homework_markings_on_homework_question_id"
    t.index ["student_id"], name: "index_homework_markings_on_student_id"
  end

  create_table "homework_questions", force: :cascade do |t|
    t.string "content", null: false
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "homework_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["homework_id"], name: "index_homework_questions_on_homework_id"
    t.index ["teacher_id"], name: "index_homework_questions_on_teacher_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "section_id", null: false
    t.bigint "subject_id", null: false
    t.index ["section_id"], name: "index_homeworks_on_section_id"
    t.index ["subject_id"], name: "index_homeworks_on_subject_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "grade_type"
    t.string "management_type"
    t.string "prefecture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id", null: false
    t.index ["school_id"], name: "index_sections_on_school_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.integer "grade", null: false
    t.string "student_id_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id", null: false
    t.bigint "section_id", null: false
    t.index ["school_id", "student_id_number"], name: "index_students_on_school_id_and_student_id_number", unique: true
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["section_id"], name: "index_students_on_section_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id", null: false
    t.index ["school_id", "name"], name: "index_subjects_on_school_id_and_name", unique: true
    t.index ["school_id"], name: "index_subjects_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.integer "grade", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id", null: false
    t.bigint "section_id", null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
    t.index ["section_id"], name: "index_teachers_on_section_id"
  end

  add_foreign_key "homework_markings", "homework_questions"
  add_foreign_key "homework_markings", "homeworks"
  add_foreign_key "homework_markings", "students"
  add_foreign_key "homework_questions", "homeworks"
  add_foreign_key "homework_questions", "teachers"
  add_foreign_key "homeworks", "sections"
  add_foreign_key "homeworks", "subjects"
  add_foreign_key "sections", "schools"
  add_foreign_key "students", "schools"
  add_foreign_key "students", "sections"
  add_foreign_key "subjects", "schools"
  add_foreign_key "teachers", "schools"
  add_foreign_key "teachers", "sections"
end
