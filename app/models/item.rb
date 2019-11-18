class Item < ApplicationRecord
  has_many :comments
  belongs_to :shipping
  belongs_to :user
  has_many :images

  enum status:{"新品未使用": 0, "ほぼ新品": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}
end
