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

ActiveRecord::Schema.define(version: 2021_01_07_130006) do

  create_table "admin_login_logs", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.integer "client_ip", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_admin_login_logs_on_admin_id"
  end

  create_table "admin_pictures", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_admin_pictures_on_admin_id"
  end

  create_table "admin_translations", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["admin_id"], name: "index_admin_translations_on_admin_id"
    t.index ["locale"], name: "index_admin_translations_on_locale"
  end

  create_table "admins", force: :cascade do |t|
    t.integer "branch_id", null: false
    t.integer "parent_id_id"
    t.string "email", limit: 100, null: false
    t.string "encrypted_password", limit: 60, null: false
    t.boolean "enable", default: true, null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_admins_on_branch_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["parent_id_id"], name: "index_admins_on_parent_id_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "title", limit: 255, null: false
    t.string "photo", limit: 100
    t.integer "sub_questions_count", default: 0, null: false
    t.boolean "has_custom", default: false, null: false
    t.boolean "default", default: false, null: false
    t.boolean "only", default: false, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "branch_translations", force: :cascade do |t|
    t.integer "branch_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["branch_id"], name: "index_branch_translations_on_branch_id"
    t.index ["locale"], name: "index_branch_translations_on_locale"
  end

  create_table "branches", force: :cascade do |t|
    t.integer "company_id", null: false
    t.boolean "use_cash", default: true, null: false
    t.boolean "use_credit", default: true, null: false
    t.boolean "use_point", default: true, null: false
    t.boolean "use_log", default: true, null: false
    t.integer "admins_count", default: 1, null: false
    t.integer "sample", default: 0, null: false
    t.integer "users_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "branches_count", default: 0, null: false
    t.integer "premium", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_translations", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["company_id"], name: "index_company_translations_on_company_id"
    t.index ["locale"], name: "index_company_translations_on_locale"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "families", force: :cascade do |t|
    t.bigint "family_category_id", null: false
    t.integer "member", default: 0, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_category_id"], name: "index_families_on_family_category_id"
  end

  create_table "family_categories", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "live_types", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "question_categories", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.string "title", limit: 60, null: false
    t.integer "questions_count", default: 0, null: false
    t.boolean "female_only", default: false, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_question_categories_on_branch_id"
  end

  create_table "question_descriptions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "description", limit: 255, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_question_descriptions_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.bigint "question_category_id", null: false
    t.string "title", limit: 255, null: false
    t.integer "answers_count", default: 0, null: false
    t.boolean "multi_answer", default: false, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_questions_on_branch_id"
    t.index ["question_category_id"], name: "index_questions_on_question_category_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles_admins", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_roles_admins_on_admin_id"
    t.index ["role_id"], name: "index_roles_admins_on_role_id"
  end

  create_table "sub_answers", force: :cascade do |t|
    t.bigint "sub_question_id", null: false
    t.string "title", limit: 60, null: false
    t.string "photo", limit: 100
    t.boolean "has_custom", default: false, null: false
    t.boolean "default", default: false, null: false
    t.boolean "only", default: false, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_question_id", "title"], name: "sub_answers_unique", unique: true
    t.index ["sub_question_id"], name: "index_sub_answers_on_sub_question_id"
  end

  create_table "sub_questions", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.string "title", limit: 150
    t.integer "sub_answers_count", default: 0, null: false
    t.boolean "multi_answer", default: false, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_sub_questions_on_answer_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.string "login_id", limit: 60, null: false
    t.string "name", limit: 100, null: false
    t.date "birthday", null: false
    t.string "encrypted_password", limit: 60, null: false
    t.boolean "sex", default: true, null: false
    t.string "photo", limit: 150
    t.boolean "enable", default: true, null: false
    t.integer "users_questions_count", default: 0, null: false
    t.integer "users_families_count", default: 0, null: false
    t.text "job", limit: 150
    t.bigint "live_type_id"
    t.bigint "education_id"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["education_id"], name: "index_users_on_education_id"
    t.index ["live_type_id"], name: "index_users_on_live_type_id"
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

  create_table "users_families", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_users_families_on_family_id"
    t.index ["user_id", "family_id"], name: "index_users_families_on_user_id_and_family_id", unique: true
    t.index ["user_id"], name: "index_users_families_on_user_id"
  end

  create_table "users_questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.integer "users_questions_answers_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_users_questions_on_question_id"
    t.index ["user_id", "question_id"], name: "index_users_questions_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_users_questions_on_user_id"
  end

  create_table "users_questions_answers", force: :cascade do |t|
    t.bigint "users_question_id", null: false
    t.bigint "answer_id", null: false
    t.integer "users_questions_answers_sub_questions_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_users_questions_answers_on_answer_id"
    t.index ["users_question_id", "answer_id"], name: "users_qa_unique", unique: true
    t.index ["users_question_id"], name: "index_users_questions_answers_on_users_question_id"
  end

  create_table "users_questions_answers_custom_answers", force: :cascade do |t|
    t.bigint "users_questions_answer_id", null: false
    t.string "title", limit: 255, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_questions_answer_id"], name: "uqaca_users_questions_answer_id", unique: true
  end

  create_table "users_questions_answers_sub_questions", force: :cascade do |t|
    t.bigint "users_questions_answer_id", null: false
    t.bigint "sub_question_id", null: false
    t.integer "users_questions_answers_sub_questions_sub_answers_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_question_id"], name: "uqas_sub_question_id"
    t.index ["users_questions_answer_id", "sub_question_id"], name: "users_sub_q_unique", unique: true
    t.index ["users_questions_answer_id"], name: "uqas_users_questions_answer_id"
  end

  create_table "users_questions_answers_sub_questions_sub_answers", force: :cascade do |t|
    t.bigint "users_questions_answers_sub_question_id", null: false
    t.bigint "sub_answer_id", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_answer_id"], name: "uqass_sub_answer_id"
    t.index ["users_questions_answers_sub_question_id", "sub_answer_id"], name: "users_sub_qa_unique", unique: true
    t.index ["users_questions_answers_sub_question_id"], name: "uqass_users_questions_answers_sub_question_id"
  end

  create_table "users_questions_answers_sub_questions_sub_answers_custom_answers", force: :cascade do |t|
    t.bigint "users_questions_answers_sub_questions_sub_answer_id", null: false
    t.string "title", limit: 255, null: false
    t.boolean "enable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_questions_answers_sub_questions_sub_answer_id"], name: "uqassa_users_questions_answers_sub_questions_sub_answer_id"
  end

end
