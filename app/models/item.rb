class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  
  enum status: ["新品未使用", "ほぼ新品", "目立った傷や汚れなし"]
end