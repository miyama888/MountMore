class Article < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture
	has_many :article_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end