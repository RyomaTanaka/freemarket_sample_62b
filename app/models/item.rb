class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images

  validates_associated :images
  validates :user, presence: true
  validates :name, presence: true
  validates :body, presence: true, length: { maximum: 40 }
  validates :price, presence: true
  validates :status, presence: true
  validates :shipping_method, presence: true
  validates :cost_burden, presence: true
  validates :period_before_shipping, presence: true
  validates :prefecture_id, presence:true

end