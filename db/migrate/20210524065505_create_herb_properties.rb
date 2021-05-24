class CreateHerbProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :herb_properties do |t|
      t.string :feature, null: false

      t.timestamps
    end
  end
end
