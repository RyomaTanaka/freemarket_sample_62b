class Address < ApplicationRecord
  belongs_to :user
  
  validates :user_name_ruby, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :post_number, presence: true
end
