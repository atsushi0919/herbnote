class AddHerbIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :herb_id, :integer
  end
end
