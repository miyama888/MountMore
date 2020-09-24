class Area < ApplicationRecord
  has_many :prefectures
  has_many :articles
end
