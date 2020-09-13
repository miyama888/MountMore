class Article < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture
	has_many :article_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :article_images, dependent: :destroy
    accepts_attachments_for :article_images, attachment: :image

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end