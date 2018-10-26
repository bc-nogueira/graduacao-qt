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

ActiveRecord::Schema.define(version: 2018_10_26_162128) do

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historicos", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "disciplina_id"
    t.float "nota"
    t.float "notavs"
    t.integer "anosemestre"
    t.boolean "frequencia"
    t.integer "ch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_historicos_on_aluno_id"
    t.index ["disciplina_id"], name: "index_historicos_on_disciplina_id"
  end

end
