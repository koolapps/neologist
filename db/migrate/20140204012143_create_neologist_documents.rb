class CreateNeologistDocuments < ActiveRecord::Migration
  def change
    create_table :neologist_documents, id: false do |t|
      t.string :name,     null: false
      t.string :gist_id,  null: false
      t.string :language
      t.text   :content

      t.timestamps
    end
    add_index :neologist_documents, :name
    add_index :neologist_documents, :gist_id
    add_index :neologist_documents, [:name, :gist_id], unique: true
  end
end
