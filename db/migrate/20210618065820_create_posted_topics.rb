class CreatePostedTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :posted_topics do |t|
      t.references :post, null: false, foreign_key: true
      t.references :herb_property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
