class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :comment, length: { maximum: 80 }, allow_blank: true
  validates :image, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
