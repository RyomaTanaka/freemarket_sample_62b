class Item < ApplicationRecord
  has_many :images
  belongs_to :shipping
  accepts_nested_attributes_for :images
end
