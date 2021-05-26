class CreateHerbPropertyRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :herb_property_relations do |t|
      t.integer :herb_id, null: false
      t.integer :herb_property_id, null: false

      t.timestamps
    end
    add_index :herb_property_relations, [:herb_id, :herb_property_id], unique: true
  end
end
