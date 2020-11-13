class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :comment, length: { maximum: 80 }
  belongs_to :user
end
