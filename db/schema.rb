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

ActiveRecord::Schema.define(version: 20190406225531) do

  create_table "boats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "client_id"
    t.string "nombre"
    t.string "matricula"
    t.string "motor"
    t.integer "estado", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_boats_on_client_id"
  end

  create_table "boxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.string "tamano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0, null: false
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.string "telefono"
    t.string "celular"
    t.string "estado", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "descent_clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "client_id"
    t.bigint "boat_id"
    t.bigint "enable_person_id"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_descent_clients_on_boat_id"
    t.index ["client_id"], name: "index_descent_clients_on_client_id"
    t.index ["enable_person_id"], name: "index_descent_clients_on_enable_person_id"
  end

  create_table "descents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.string "nombre_bote"
    t.string "matricula_bote"
    t.string "motor_bote"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enable_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "client_id"
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.integer "estado", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_enable_people_on_client_id"
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "client_id"
    t.bigint "box_id"
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "estado", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_reservations_on_box_id"
    t.index ["client_id"], name: "index_reservations_on_client_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "dni", default: "", null: false
    t.string "address", default: "", null: false
    t.string "user_type", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boats", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "descent_clients", "boats"
  add_foreign_key "descent_clients", "clients"
  add_foreign_key "descent_clients", "enable_people"
  add_foreign_key "enable_people", "clients"
  add_foreign_key "reservations", "boxes"
  add_foreign_key "reservations", "clients"
end
