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

ActiveRecord::Schema.define(version: 20190225033950) do

  create_table "dieta", force: :cascade do |t|
    t.string "dietaPDF"
    t.integer "nutriologo_id"
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutriologo_id"], name: "index_dieta_on_nutriologo_id"
    t.index ["paciente_id"], name: "index_dieta_on_paciente_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "asset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
  end

  create_table "horarios", force: :cascade do |t|
    t.datetime "hora_disponible"
    t.boolean "apartada", default: false
    t.string "sede"
    t.integer "nutriologo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutriologo_id"], name: "index_horarios_on_nutriologo_id"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta", force: :cascade do |t|
    t.string "meta"
    t.boolean "cumplida", default: false
    t.integer "sesions_id"
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_meta_on_paciente_id"
    t.index ["sesions_id"], name: "index_meta_on_sesions_id"
  end

  create_table "nutriologos", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_nutriologos_on_reset_password_token", unique: true
    t.index ["username"], name: "index_nutriologos_on_username", unique: true
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "objetivo", default: "ser más saludable"
    t.index ["reset_password_token"], name: "index_pacientes_on_reset_password_token", unique: true
    t.index ["username"], name: "index_pacientes_on_username", unique: true
  end

  create_table "sesions", force: :cascade do |t|
    t.float "peso"
    t.float "estatura"
    t.float "grasa"
    t.float "musculo"
    t.float "imc"
    t.float "grasa_vis"
    t.integer "edad_metabolica"
    t.integer "hora_id"
    t.integer "paciente_id"
    t.integer "nutriologo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cintura"
    t.index ["nutriologo_id"], name: "index_sesions_on_nutriologo_id"
    t.index ["paciente_id"], name: "index_sesions_on_paciente_id"
  end

  create_table "tips_ycomentarios", force: :cascade do |t|
    t.string "tip"
    t.string "remitente"
    t.integer "nutriologo_id"
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutriologo_id"], name: "index_tips_ycomentarios_on_nutriologo_id"
    t.index ["paciente_id"], name: "index_tips_ycomentarios_on_paciente_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
