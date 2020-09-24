class Prefecture < ApplicationRecord
  belongs_to :area
  has_many :articles
end
