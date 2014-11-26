# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141125192136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "perfils", force: true do |t|
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareas", force: true do |t|
    t.string   "titulo"
    t.text     "desc"
    t.integer  "horas"
    t.date     "fecha"
    t.integer  "tipo_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tareas", ["tipo_id"], name: "index_tareas_on_tipo_id", using: :btree
  add_index "tareas", ["titulo"], name: "index_tareas_on_titulo", using: :btree
  add_index "tareas", ["usuario_id"], name: "index_tareas_on_usuario_id", using: :btree

  create_table "tipos", force: true do |t|
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "nickname"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree

end
