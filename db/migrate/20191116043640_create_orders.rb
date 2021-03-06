class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.bigint :seller_id, null: false, foreign_key: true
      t.bigint :buyer_id, null: false, foreign_key: true
      t.bigint :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
