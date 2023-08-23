class CreateIdentityDocumentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :identity_document_types do |t|
      t.string :uid
      t.string :name
      t.text :description
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
