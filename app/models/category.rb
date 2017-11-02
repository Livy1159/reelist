class Category < ApplicationRecord
  has_many :film_categories
  has_many :films, through: :film_categories, source: :film
  has_many :reviews, through: :films
end
