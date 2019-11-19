class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :into
      t.string :image
      t.timestamps
    end
  end
end
