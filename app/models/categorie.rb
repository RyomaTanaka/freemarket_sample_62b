class Categorie < ApplicationRecord
  has_many :items
  has_ancestry#自己完結
end
