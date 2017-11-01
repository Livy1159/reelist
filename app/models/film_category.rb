class FilmCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :films
end
