class Item < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

validates :name, :body, :price, :status, :order_status, :prefecture, :cost_burden, :period_before_shipping


end
