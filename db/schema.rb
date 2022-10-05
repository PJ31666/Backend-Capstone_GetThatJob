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

ActiveRecord::Schema[7.0].define(version: 2022_10_05_174112) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.text "professional_experience"
    t.text "professional_interesed"
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followings", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_followings_on_job_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "job_title"
    t.bigint "categories_id", null: false
    t.integer "type"
    t.text "optional_requirements"
    t.text "mandatory_requirements"
    t.text "about_job"
    t.integer "min_salary"
    t.integer "max_salary"
    t.boolean "job_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_jobs_on_categories_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.integer "role"
    t.integer "phone"
    t.string "name"
    t.date "birthdate"
    t.string "job_title"
    t.text "professional_experience"
    t.text "education"
    t.integer "application_count"
    t.string "linked_url"
    t.string "company_name"
    t.string "company_url"
    t.text "about_company"
    t.integer "jobs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "users"
  add_foreign_key "followings", "jobs"
  add_foreign_key "followings", "users"
  add_foreign_key "jobs", "categories", column: "categories_id"
  add_foreign_key "jobs", "users"
end
