class AddColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :herb_id, :integer
    add_column :posts, :topic_id, :integer
  end
end
