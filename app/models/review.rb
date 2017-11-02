class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
  accepts_nested_attributes_for :comments
end
