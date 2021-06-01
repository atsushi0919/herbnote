class CreateHerbDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :herb_descriptions do |t|
      t.integer :herb_id, null: false
      t.text :overview
      t.text :how_to_use
      t.text :how_to_grow
      t.text :note

      t.timestamps
    end
  end
end
