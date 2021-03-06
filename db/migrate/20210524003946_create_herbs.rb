class CreateHerbs < ActiveRecord::Migration[6.1]
  def change
    create_table :herbs do |t|
      t.string :name, null: false
      t.string :alies
      t.integer :classification, null: false, default: 0
      t.string :image, null: false, default: "noimage.jpg"

      t.timestamps
    end
  end
end
