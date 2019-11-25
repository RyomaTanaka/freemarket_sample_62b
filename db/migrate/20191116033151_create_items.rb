class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.bigint :user_id,foreign_key: true
      t.string :name, null: false
      t.string :image_url
      t.text :body, null: false
      t.integer :price, null: false
      t.string :condition
      t.references :shipping,foreign_key: true
      t.integer :status
      t.integer :order_status
      t.timestamps
    end
  end
end