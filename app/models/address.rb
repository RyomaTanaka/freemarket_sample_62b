class Address < ApplicationRecord

  belongs_to :user
  
  validates :user_name, presence: true
  validates :user_name_ruby, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :prefecture, presence: true, format: {with: /\A[0-9-]{,14}\z/}
  validates :city, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :house_number, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :post_number, presence: true, format: {with: /\A[0-9-]{,14}\z/}
end
