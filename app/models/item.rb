class Item < ApplicationRecord
  belongs_to :user
  belongs_to :shipping
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :shippings# shippingも使えるようになる
  accepts_nested_attributes_for :images
end
