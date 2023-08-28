class CreateTransferReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :transfer_reasons do |t|
      t.string :uid
      t.string :name
      t.string :description
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
