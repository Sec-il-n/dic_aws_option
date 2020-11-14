class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :email, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 6 }
  end
  before_validation { email.downcase! }
  has_secure_password
  has_many :feeds
  has_many :favorites, dependent: :destroy
  has_many :favorite_feeds, through: :favorites, source: :feed
end
