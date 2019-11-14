class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :order, dependent: :destroy
  belongs_to :shipping
  belongs_to :user
  belongs_to :category
end
