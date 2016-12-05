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

ActiveRecord::Schema.define(version: 20161202022559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bridge_receive_callbacks", force: :cascade do |t|
    t.bigint   "external_id", null: false
    t.string   "from",        null: false
    t.string   "route",       null: false
    t.decimal  "amount",      null: false
    t.string   "asset_code",  null: false
    t.string   "memo_type",   null: false
    t.string   "memo",        null: false
    t.text     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["asset_code"], name: "index_bridge_receive_callbacks_on_asset_code", using: :btree
    t.index ["external_id"], name: "index_bridge_receive_callbacks_on_external_id", unique: true, using: :btree
    t.index ["from"], name: "index_bridge_receive_callbacks_on_from", using: :btree
    t.index ["memo"], name: "index_bridge_receive_callbacks_on_memo", using: :btree
  end

  create_table "claims", force: :cascade do |t|
    t.string   "recipient_first_name", null: false
    t.string   "recipient_last_name",  null: false
    t.string   "ref_no",               null: false
    t.decimal  "amount"
    t.string   "txn_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "txns", force: :cascade do |t|
    t.string   "recipient_first_name",                 null: false
    t.string   "recipient_last_name",                  null: false
    t.string   "ref_no"
    t.string   "external_id"
    t.string   "status"
    t.decimal  "amount",               default: "0.0", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["external_id"], name: "index_txns_on_external_id", using: :btree
    t.index ["ref_no"], name: "index_txns_on_ref_no", unique: true, using: :btree
    t.index ["status"], name: "index_txns_on_status", using: :btree
  end

end
