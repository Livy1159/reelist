class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rateable, polymorphic: true

  def avg_rating
    total = 0
  end
end
