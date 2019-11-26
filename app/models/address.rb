class Address < ApplicationRecord
  belongs_to :user
  
  validates :user_name, presence: true
  validates :user_name_ruby, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :post_number, presence: true
end
