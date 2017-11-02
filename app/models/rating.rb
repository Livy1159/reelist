class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rateable, polymorphic: true

  def avg_rating
    total = 0
    self.ratings.each do |element|
      total += element.rating
    end
    if self.ratings.length == 0
      return total / 1
    else
      return total / self.ratings.length
    end
  end
end
