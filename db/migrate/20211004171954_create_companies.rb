class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :uid
      t.string :name, unique: true
      t.string :social_reason
      t.string :address
      t.references :country, foreign_key: true
      t.string :city
      t.string :phone
      t.string :po_box
      t.string :postal_code
      t.string :email
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
