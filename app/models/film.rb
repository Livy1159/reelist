class Film < ApplicationRecord
  has_many :reviews
  has_many :film_categories
  has_many :categories, through: :film_categories
  belongs_to :commentable, polymorphic: true
  belongs_to :rateable, polymorphic: true
end
