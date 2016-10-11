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

ActiveRecord::Schema.define(version: 20161011042759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora_inicio"
    t.integer  "estado"
    t.integer  "stylist_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_appointments_on_customer_id", using: :btree
    t.index ["stylist_id"], name: "index_appointments_on_stylist_id", using: :btree
  end

  create_table "califications", force: :cascade do |t|
    t.integer  "stylist_id"
    t.integer  "customer_id"
    t.integer  "calificacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["customer_id"], name: "index_califications_on_customer_id", using: :btree
    t.index ["stylist_id"], name: "index_califications_on_stylist_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "tipo_discapacidad"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["person_id"], name: "index_customers_on_person_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "comentario"
    t.string   "foto_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_experiences_on_person_id", using: :btree
  end

  create_table "haircut_stylists", force: :cascade do |t|
    t.integer  "stylist_id"
    t.integer  "haircut_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["haircut_id"], name: "index_haircut_stylists_on_haircut_id", using: :btree
    t.index ["stylist_id"], name: "index_haircut_stylists_on_stylist_id", using: :btree
  end

  create_table "haircuts", force: :cascade do |t|
    t.string   "nombre_corte"
    t.string   "descripcion"
    t.string   "foto"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.boolean  "genero"
    t.string   "telefono_movil"
    t.string   "telefono_fijo"
    t.integer  "ubication_id"
    t.string   "foto_perfil"
    t.string   "tipo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["ubication_id"], name: "index_people_on_ubication_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.integer  "stylist_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["stylist_id"], name: "index_schedules_on_stylist_id", using: :btree
  end

  create_table "stylists", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "especialidad"
    t.string   "correo_electronico"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["person_id"], name: "index_stylists_on_person_id", using: :btree
  end

  create_table "ubications", force: :cascade do |t|
    t.string   "barrio"
    t.string   "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "customers"
  add_foreign_key "appointments", "stylists"
  add_foreign_key "califications", "customers"
  add_foreign_key "califications", "stylists"
  add_foreign_key "customers", "people"
  add_foreign_key "experiences", "people"
  add_foreign_key "haircut_stylists", "haircuts"
  add_foreign_key "haircut_stylists", "stylists"
  add_foreign_key "people", "ubications"
  add_foreign_key "schedules", "stylists"
  add_foreign_key "stylists", "people"
end
