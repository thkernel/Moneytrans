class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :uid
      t.string :name
      t.string :iso_code
      t.string :symbol
      t.string :decimal_symbol
      t.string :symbol_position
      t.string :thousand_separator
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
