class Film < ApplicationRecord
  has_many :reviews
  has_many :film_categories
  has_many :categories, through: :film_categories, source: :category
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable

  validates :title, presence: true

  def avg_rating
    total = 0
    self.ratings.each do |element|
      total += element.value
    end
    if self.ratings.length == 0
      return total / 1
    else
      return total / self.ratings.length
    end
  end
end
