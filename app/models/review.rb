class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
  accepts_nested_attributes_for :comments

  default_scope { order(created_at: :desc)}

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
