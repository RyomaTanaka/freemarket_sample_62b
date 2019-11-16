class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.references :shipping, null: false, foreign_key: true
      t.integer :status, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end