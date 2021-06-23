class CreateFavoriteHerbs < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_herbs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :herb, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorite_herbs, [:user_id, :herb_id], unique: true
  end
end
