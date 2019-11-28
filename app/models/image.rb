class Image < ApplicationRecord

  belongs_to :item
  mount_uploader :image, ImageUploader


  belongs_to :item



  validates :image, presence:true


end
