class Article < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture
  belongs_to :area
	has_many :article_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :article_images, dependent: :destroy
  accepts_attachments_for :article_images, attachment: :image

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}
  validates :latitude, presence: true
  validates :longitude, presence: true
	validate :presence_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def presence_image
  errors.add(:article, "写真を投稿してください") if article_images.size == 0
  end
end