# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_23_141552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "uid"
    t.string "login"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.bigint "role_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable"
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "social_reason"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.string "po_box"
    t.string "postal_code"
    t.string "email"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_companies_on_account_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_countries_on_account_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "iso_code"
    t.string "symbol"
    t.string "decimal_symbol"
    t.string "symbol_position"
    t.string "thousand_separator"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_currencies_on_account_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "po_box"
    t.string "zip_code"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "subject_class"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identity_document_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_identity_document_types_on_account_id"
  end

  create_table "permission_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "permission_id"
    t.string "action_name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_permission_items_on_permission_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "uid"
    t.bigint "feature_id"
    t.bigint "role_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smtp_server_settings", force: :cascade do |t|
    t.string "uid"
    t.string "host"
    t.string "user_name"
    t.string "user_password"
    t.string "domain"
    t.string "address"
    t.integer "port"
    t.string "authentification"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_smtp_server_settings_on_account_id"
  end

  create_table "transfer_reasons", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "description"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transfer_reasons_on_account_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.string "uid"
    t.bigint "mtcn"
    t.bigint "transfer_reason_id"
    t.float "amount_incl_tax", default: 0.0
    t.bigint "transfer_currency_id"
    t.float "standard_rate", default: 0.0
    t.float "standard_rate_amount", default: 0.0
    t.bigint "withdrawal_currency_id"
    t.float "sell_rate", default: 0.0
    t.float "sell_rate_amount", default: 0.0
    t.float "gross_profit", default: 0.0
    t.float "expense", default: 0.0
    t.float "net_profit", default: 0.0
    t.string "sender_first_name"
    t.string "sender_last_name"
    t.string "sender_gender"
    t.string "sender_phone"
    t.bigint "sender_identity_document_type_id"
    t.string "sender_identity_document_code"
    t.bigint "sender_country_id"
    t.string "sender_city"
    t.string "beneficiary_first_name"
    t.string "beneficiary_last_name"
    t.string "beneficiary_gender"
    t.string "beneficiary_phone"
    t.bigint "beneficiary_country_id"
    t.string "beneficiary_city"
    t.datetime "withdrawal_date"
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transfers_on_account_id"
    t.index ["beneficiary_country_id"], name: "index_transfers_on_beneficiary_country_id"
    t.index ["sender_country_id"], name: "index_transfers_on_sender_country_id"
    t.index ["sender_identity_document_type_id"], name: "index_transfers_on_sender_identity_document_type_id"
    t.index ["transfer_currency_id"], name: "index_transfers_on_transfer_currency_id"
    t.index ["transfer_reason_id"], name: "index_transfers_on_transfer_reason_id"
    t.index ["withdrawal_currency_id"], name: "index_transfers_on_withdrawal_currency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "withdrawals", force: :cascade do |t|
    t.string "uid"
    t.bigint "transfer_id", null: false
    t.bigint "beneficiary_identity_document_type_id"
    t.string "beneficiary_identity_document_code"
    t.float "amount_incl_tax", default: 0.0
    t.string "status"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_withdrawals_on_account_id"
    t.index ["beneficiary_identity_document_type_id"], name: "index_withdrawals_on_beneficiary_identity_document_type_id"
    t.index ["transfer_id"], name: "index_withdrawals_on_transfer_id"
  end

  add_foreign_key "accounts", "roles"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "companies", "accounts"
  add_foreign_key "countries", "accounts"
  add_foreign_key "currencies", "accounts"
  add_foreign_key "identity_document_types", "accounts"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "smtp_server_settings", "accounts"
  add_foreign_key "transfer_reasons", "accounts"
  add_foreign_key "transfers", "accounts"
  add_foreign_key "transfers", "transfer_reasons"
  add_foreign_key "withdrawals", "accounts"
  add_foreign_key "withdrawals", "transfers"
end
