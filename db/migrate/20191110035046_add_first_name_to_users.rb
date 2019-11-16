class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string,    null: false, unique: true, default:"" 
  end
end
