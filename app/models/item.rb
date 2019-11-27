class Item < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

validates :name, presence: true
validates :body, presence: true
validates :price, presence: true
validates :status, presence: true
validates :order_status, presence: true
validates :prefecture, presence: true
validates :cost_burden, presence: true
validates :period_before_shipping, presence: true


end
