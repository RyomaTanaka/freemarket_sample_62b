class CreateAddress01s < ActiveRecord::Migration[5.2]
  def change
    create_table :address01s do |t|
      t.integer :prefecture_id
      t.string :city
      t.string :name

      t.timestamps
    end
  end
end
