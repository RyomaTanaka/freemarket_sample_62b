class Item < ApplicationRecord

  belongs_to :shipping
  # belongs_to :category
  has_many :images, dependent: :destroy

  has_many :images
  belongs_to :shipping

  accepts_nested_attributes_for :images
end
