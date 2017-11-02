class Film < ApplicationRecord
  has_many :reviews
  has_many :film_categories
  has_many :categories, through: :film_categories, source: :category
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
end
