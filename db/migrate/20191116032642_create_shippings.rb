class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :prefecure, null: false
      t.string :method
      t.string :cost_burden, null: false
      t.string :period_before_shipping, null: false
      t.timestamps
    end
  end
end
