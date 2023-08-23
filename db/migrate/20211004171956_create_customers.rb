class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.string :address
      t.string :country
      t.string :city
  
      t.string :phone
      t.string :street
      t.string :po_box
      t.string :zip_code
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
