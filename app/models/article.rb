class Article < ApplicationRecord
	belongs_to :user
	has_many :article_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}
end