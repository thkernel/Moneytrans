class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.string :uid
      t.bigint :mtcn
      t.references :transfer_reason, foreign_key: true
      t.float :amount_incl_tax, default: 0.0
      t.references :transfer_currency
      t.float :standard_rate, default: 0.0
      t.float :standard_rate_amount, default: 0.0
      t.references :withdrawal_currency
      t.float :sell_rate, default: 0.0
      t.float :sell_rate_amount, default: 0.0
      t.float :gross_profit, default: 0.0
      t.float :expense, default: 0.0
      t.float :net_profit, default: 0.0
      t.string :sender_first_name
      t.string :sender_last_name
      t.string :sender_gender
      t.string :sender_phone
      t.references :sender_identity_document_type
      t.string :sender_identity_document_code
      t.references :sender_country
      t.string :sender_city
      t.string :beneficiary_first_name
      t.string :beneficiary_last_name
      t.string :beneficiary_gender
      t.string :beneficiary_phone
      t.references :beneficiary_country
      t.string :beneficiary_city
      t.datetime :withdrawal_date
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
