class Item < ApplicationRecord
  has_many :images
  belongs_to :shipping
  belongs_to :user
  accepts_nested_attributes_for :images
end
