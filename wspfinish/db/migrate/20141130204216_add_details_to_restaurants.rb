class AddDetailsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :logo, :string
    add_column :restaurants, :start_time, :time
    add_column :restaurants, :end_time, :time
  end
end
