class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :ratings

end
