class CreateNeologistGists < ActiveRecord::Migration
  def change
    create_table :neologist_gists, id: false do |t|
      t.string     :id,                   null: false
      t.string     :author_id,            null: false
      t.boolean    :public,               null: false,  default: true
      t.integer    :publication_state,    null: false,  default: 0
      t.boolean    :stale,                null: false,  default: true
      t.timestamp  :fetched_at
      t.text       :content
      t.timestamp  :compiled_at

      t.timestamps
    end
    add_index :neologist_gists, :id,        unique: true
    add_index :neologist_gists, :author_id, unique: true
  end
end
