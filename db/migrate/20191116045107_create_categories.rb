class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.bigint :parent_id, foreign_key: true
      t.string :ancestry
      t.timestamps
    end
    
    add_index :categories, :ancestry
  end
end
