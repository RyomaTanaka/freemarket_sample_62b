class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :categorie
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :shipping_method, presence: true
  validates :order_status, presence: true
  validates :prefecture, presence: true
  validates :cost_burden, presence: true
  validates :period_before_shipping, presence: true
  
  enum status: {"---":0, "新品未使用":1, "ほぼ新品":2, "目立った傷や汚れなし":3, "やや傷や汚れあり":4, "傷や汚れあり":5, "全体的に状態が悪い":6}
end