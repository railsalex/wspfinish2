class AddAddressAndTelephoneToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :address, :string
    add_column :carts, :telephone, :string
  end
end
