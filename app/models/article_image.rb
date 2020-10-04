class ArticleImage < ApplicationRecord
  has_many :tags, dependent: :destroy
  belongs_to :article
  attachment :image
end
