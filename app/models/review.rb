class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  belongs_to :commentable, polymorphic: true

end
