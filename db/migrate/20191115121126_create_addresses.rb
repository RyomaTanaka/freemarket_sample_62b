class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_name, null: false
      t.string :user_name_ruby, null: false
      t.sstritring :post_number, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.integer :phone_number
      t.timestamps
    end
  end
end
