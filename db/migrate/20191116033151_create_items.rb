class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :order_status, null: false
      t.string :shipping_method, null: false
      t.string :cost_burden, null: false
      t.string :period_before_shipping, null: false
      t.integer :prefecture_id, null: false
      t.timestamps
    end
  end
end