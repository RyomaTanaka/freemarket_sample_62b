class Item < ApplicationRecord
  has_many :images
  belongs_to :shipping
  
end
