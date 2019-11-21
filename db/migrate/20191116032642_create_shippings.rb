class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :prefecure
      t.string :method
      t.string :cost_burden
      t.string :period_before_shipping
      t.timestamps
    end
  end
end
