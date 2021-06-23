class AddFavoriteCountToHerbs < ActiveRecord::Migration[6.1]
  def change
    add_column :herbs, :favorite_count, :integer, dafault: 0
  end
end
