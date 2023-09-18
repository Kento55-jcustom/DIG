class CreateIbaneTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :ibane_tag_relations do |t|
      t.references :ibane, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
