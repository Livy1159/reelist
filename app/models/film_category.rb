class FilmCategory < ApplicationRecord
  belongs_to :category
  belongs_to :film
end
