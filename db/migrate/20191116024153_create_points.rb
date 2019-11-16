class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score, null: false
      t.timestamps
    end
  end
end
