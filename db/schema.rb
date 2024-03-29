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

ActiveRecord::Schema.define(version: 20171030134139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string   "image_uid"
    t.string   "nome"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "matricula"
    t.string   "email"
    t.string   "password_digest"
    t.string   "periodo"
    t.index ["email"], name: "index_alunos_on_email", unique: true, using: :btree
    t.index ["matricula"], name: "index_alunos_on_matricula", unique: true, using: :btree
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "tipo"
    t.integer  "kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kit_id", "created_at"], name: "index_feeds_on_kit_id_and_created_at", using: :btree
    t.index ["kit_id"], name: "index_feeds_on_kit_id", using: :btree
  end

  create_table "kit_types", force: :cascade do |t|
    t.string   "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kits", force: :cascade do |t|
    t.string   "nome"
    t.string   "image_uid"
    t.integer  "aluno_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "kit_type_id"
    t.index ["aluno_id", "created_at"], name: "index_kits_on_aluno_id_and_created_at", using: :btree
    t.index ["aluno_id"], name: "index_kits_on_aluno_id", using: :btree
    t.index ["kit_type_id"], name: "index_kits_on_kit_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "feeds", "kits"
  add_foreign_key "kits", "alunos"
  add_foreign_key "kits", "kit_types"
end
