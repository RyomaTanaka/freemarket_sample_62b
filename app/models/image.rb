class Image < ApplicationRecord
  belongs_to :item

  # mount_uploader :url, ImageUploader

  # validates :image, presence: true
end
