class CreateHerbs < ActiveRecord::Migration[6.1]
  def change
    create_table :herbs do |t|
      t.string :name, null: false
      t.string :alies
      t.integer :plant_type, null: false, default: 0
      t.string :image, null: false, default: "noimage.png"

      t.timestamps
    end
  end
end
