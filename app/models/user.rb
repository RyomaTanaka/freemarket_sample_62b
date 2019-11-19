class User < ApplicationRecord
  
  has_many :addresses, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :addresses, :profile

  # ----------------------------------------
  # has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128


         
end
