class Item < ApplicationRecord
  belongs_to :shipping
  # belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
