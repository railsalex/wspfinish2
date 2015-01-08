class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.integer :restaurant_id
      t.integer :group_id
      t.string :img_url
      t.string :status

      t.timestamps
    end
  end
end
