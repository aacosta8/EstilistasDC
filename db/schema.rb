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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calificacion", primary_key: "idcalificacion", id: :string, force: :cascade do |t|
    t.string  "idestilista",  null: false
    t.string  "idcliente",    null: false
    t.integer "calificacion", null: false
  end

  create_table "cita", primary_key: "idcita", id: :string, force: :cascade do |t|
    t.date   "fecha",       null: false
    t.time   "horainicio",  null: false
    t.string "idestado",    null: false
    t.string "idestilista", null: false
    t.string "idcliente"
  end

  create_table "cliente", primary_key: "idcliente", id: :string, force: :cascade do |t|
    t.string "tipodiscapacidad"
  end

  create_table "corte", primary_key: "idcorte", id: :string, force: :cascade do |t|
    t.string "nombrecorte", null: false
    t.string "descripcion"
    t.binary "foto"
  end

  create_table "detalleestado", primary_key: "idestado", id: :string, force: :cascade do |t|
    t.string "estado", null: false
  end

  create_table "estilista", primary_key: "idestilista", id: :string, force: :cascade do |t|
    t.string "especialidad",      null: false
    t.string "correoelectronico", null: false
  end

  create_table "estilistacorte", id: false, force: :cascade do |t|
    t.string "idestilista", null: false
    t.string "idcorte"
  end

  create_table "experiencia", primary_key: "idexperiencia", id: :string, force: :cascade do |t|
    t.string "idpersona",  null: false
    t.string "comentario", null: false
    t.binary "fotoexp"
  end

# Could not dump table "horario" because of following StandardError
#   Unknown type 'time with time zone' for column 'horainicio'

  create_table "persona", primary_key: "idpersona", id: :string, force: :cascade do |t|
    t.string  "nombre",          null: false
    t.string  "apellido",        null: false
    t.date    "fechanacimiento"
    t.boolean "genero",          null: false
    t.string  "telefonomovil",   null: false
    t.string  "telefonofijo"
    t.string  "idubicacion"
    t.binary  "fotoperfil"
    t.string  "tipo",            null: false
  end

  create_table "ubicacion", primary_key: "idubicacion", id: :string, force: :cascade do |t|
    t.string "barrio",    null: false
    t.string "direccion", null: false
  end

  add_foreign_key "calificacion", "cliente", column: "idcliente", primary_key: "idcliente", name: "calificacion_idcliente_fkey"
  add_foreign_key "calificacion", "estilista", column: "idestilista", primary_key: "idestilista", name: "calificacion_idestilista_fkey"
  add_foreign_key "cita", "cliente", column: "idcliente", primary_key: "idcliente", name: "cita_idcliente_fkey"
  add_foreign_key "cita", "detalleestado", column: "idestado", primary_key: "idestado", name: "cita_idestado_fkey"
  add_foreign_key "cita", "estilista", column: "idestilista", primary_key: "idestilista", name: "cita_idestilista_fkey"
  add_foreign_key "cliente", "persona", column: "idcliente", primary_key: "idpersona", name: "cliente_idcliente_fkey"
  add_foreign_key "estilista", "persona", column: "idestilista", primary_key: "idpersona", name: "estilista_idestilista_fkey"
  add_foreign_key "estilistacorte", "corte", column: "idcorte", primary_key: "idcorte", name: "estilistacorte_idcorte_fkey"
  add_foreign_key "estilistacorte", "estilista", column: "idestilista", primary_key: "idestilista", name: "estilistacorte_idestilista_fkey"
  add_foreign_key "experiencia", "persona", column: "idpersona", primary_key: "idpersona", name: "experiencia_idpersona_fkey"
  add_foreign_key "horario", "estilista", column: "idestilista", primary_key: "idestilista", name: "horario_idestilista_fkey"
  add_foreign_key "persona", "ubicacion", column: "idubicacion", primary_key: "idubicacion", name: "persona_idubicacion_fkey"
end
