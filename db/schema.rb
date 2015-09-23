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

ActiveRecord::Schema.define(version: 20150914141460) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "backgrounds", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "patient_id",              null: false
    t.integer  "menarquia"
    t.string   "reglas"
    t.string   "gesta"
    t.string   "paridad"
    t.string   "vivos"
    t.string   "muertos"
    t.string   "abortos"
    t.string   "mola"
    t.string   "foceps"
    t.string   "cesareas"
    t.string   "gemelares"
    t.string   "podalicos"
    t.string   "prematuros"
    t.string   "pmf"
    t.text     "otros"
    t.string   "grupo_sangre_embarazada"
    t.string   "rh_embarazada"
    t.string   "grupo_sangre_esposo"
    t.string   "rh_esposo"
    t.text     "toxoplasmosis"
    t.boolean  "sensibilizacion"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "backgrounds", ["patient_id"], name: "index_backgrounds_on_patient_id", unique: true, using: :btree

  create_table "controls", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "pregnancy_id", null: false
    t.datetime "fecha"
    t.string   "eg"
    t.float    "au"
    t.float    "ta"
    t.float    "peso"
    t.string   "present"
    t.integer  "ff"
    t.string   "edemas"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "controls", ["pregnancy_id"], name: "index_controls_on_pregnancy_id", using: :btree

  create_table "images", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "pregnancy_id", null: false
    t.datetime "fecha"
    t.string   "imagen"
    t.text     "descripcion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "images", ["pregnancy_id"], name: "index_images_on_pregnancy_id", using: :btree

  create_table "laboratories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "patient_id", null: false
    t.datetime "fecha"
    t.float    "hb"
    t.float    "htc"
    t.string   "vdrl"
    t.float    "glicemia"
    t.string   "orina"
    t.string   "heces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "laboratories", ["patient_id"], name: "index_laboratories_on_patient_id", using: :btree

  create_table "patients", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.integer  "edad",       null: false
    t.text     "direccion",  null: false
    t.string   "cedula",     null: false
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patients", ["cedula"], name: "index_patients_on_cedula", unique: true, using: :btree

  create_table "pregnancies", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "patient_id", null: false
    t.boolean  "status",     null: false
    t.datetime "fur"
    t.datetime "fpp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pregnancies", ["patient_id"], name: "index_pregnancies_on_patient_id", using: :btree

end
