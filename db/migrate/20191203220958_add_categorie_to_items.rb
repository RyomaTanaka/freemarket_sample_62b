class AddCategorieToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :categorie, foreign_key: true
  end
end
