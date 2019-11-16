class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname,           null: false, unique: true, default:"" 
      t.text :introduction
      t.string :image
      t.timestamps
    end
  end
end
