class Item < ApplicationRecord
  belongs_to :user
  belongs_to :shipping
  belongs_to :category
  has_many :images, dependent: :destroy
  has_one :order, dependent: :destroy
  # accepts_nested_attributes_for :shippings# shippingも使えるようになる
  accepts_nested_attributes_for :images
end
