class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  # delegate :name, to: :prefecture
  has_many :images
  accepts_nested_attributes_for :images

  # enum status: [ ["---",""], ["新品,未使用",1], ["未使用に近い",2], ["目立った傷や汚れなし",3], ["やや傷や汚れあり",4], ["傷や汚れあり",5], ["全体的に状態が悪い",6]]
end