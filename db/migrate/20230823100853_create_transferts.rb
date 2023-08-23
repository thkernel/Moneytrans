class CreateTransferts < ActiveRecord::Migration[6.1]
  def change
    create_table :transferts do |t|
      t.string :uid
      t.bigint :mtcn
      t.references :currency, foreign_key: true
      t.string :reason
      t.float :amount_incl_tax, default: 0.0
      t.string :sender_name
      t.string :sender_first_name
      t.string :sender_gender
      t.string :sender_phone
      t.references :sender_identity_document_type
      t.string :sender_identity_document_type_code
      t.string :sender_country
      t.string :sender_city
      t.string :beneficiary_name
      t.string :beneficiary_first_name
      t.string :beneficiary_gender
      t.string :beneficiary_phone
      t.string :beneficiary_country
      t.string :beneficiary_city
      t.datetime :withdrawal_date
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
