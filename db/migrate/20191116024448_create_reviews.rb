class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.integer :rate, null: false
      t.timestamps
    end
  end
end
