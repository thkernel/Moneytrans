class CreateWithdrawals < ActiveRecord::Migration[6.1]
  def change
    create_table :withdrawals do |t|
      t.string :uid
      t.references :transfer, null: false, foreign_key: true
      t.references :beneficiary_identity_document_type
      t.string :beneficiary_identity_document_code
      t.float :amount_incl_tax, default: 0.0
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
