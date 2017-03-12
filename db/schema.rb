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

ActiveRecord::Schema.define(version: 20170312071634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

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
    t.integer  "status"
    t.index ["status"], name: "index_claims_on_status", using: :btree
  end

  create_table "txns", force: :cascade do |t|
    t.string   "recipient_first_name",                 null: false
    t.string   "recipient_last_name",                  null: false
    t.string   "ref_no"
    t.string   "external_id"
    t.decimal  "amount",               default: "0.0", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "sender_first_name"
    t.string   "sender_last_name"
    t.string   "recipient_mobile"
    t.string   "remote_status"
    t.integer  "status",               default: 0
    t.integer  "user_id"
    t.index ["external_id"], name: "index_txns_on_external_id", using: :btree
    t.index ["ref_no"], name: "index_txns_on_ref_no", unique: true, using: :btree
    t.index ["status"], name: "index_txns_on_status", using: :btree
    t.index ["user_id"], name: "index_txns_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "txns", "users"
end
