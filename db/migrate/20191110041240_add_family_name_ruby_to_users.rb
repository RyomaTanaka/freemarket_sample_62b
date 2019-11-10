class AddFamilyNameRubyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name_ruby, :string, null: false, unique: true, default:"" 
  end
end
