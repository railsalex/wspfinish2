class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :password_digest
      t.string :email, unique: true
      t.string :address
      t.string :telephone
      t.boolean :admin
      t.string :remember_token

      t.timestamps
    end
  end
end
