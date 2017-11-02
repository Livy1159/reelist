class Film < ApplicationRecord
  has_many :reviews
  has_many :categories, class_name: 'FilmCategory'
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
end
