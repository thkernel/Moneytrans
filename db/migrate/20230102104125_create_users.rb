class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :phone
      t.text :description
      t.string :status
      #t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
