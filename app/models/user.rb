class User < ApplicationRecord
  
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128


         
end
