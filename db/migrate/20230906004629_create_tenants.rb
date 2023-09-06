class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :uid
      t.string :name, unique: true
      t.string :social_reason
      t.string :address
      t.string :phone
      t.string :country
      t.string :city
      t.string :email
      t.string :website
      t.string :subdomain
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
