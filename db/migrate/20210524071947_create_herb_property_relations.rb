class CreateHerbPropertyRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :herb_property_relations do |t|
      t.integer :herb_id
      t.integer :herb_property_id

      t.timestamps
    end
  end
end
