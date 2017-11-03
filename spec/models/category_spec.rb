require 'rails_helper'

describe Category do
  let(:film) { Film.create(title: "test") }
  let(:category) { Category.create(name: "test") }
  let(:user) { User.create(email: 'test@test.com', username:'test', password: '123')}

  describe "category reviews" do
    it "has many reviews" do
      # films = FilmCategory.create(film: film, category: category)
      review = Review.create(film: film, body: "awesome
        film", user_id: user.id)
        expect(category.reviews.first).to eq(review)
    end
  end

#   describe "film categories" do
#     it "has many categories" do
#       film_category = FilmCategory.create(film: film, category: category)
#       expect(film.categories.first).to eq(category)
#     end
#   end


#   describe "film comments" do
#     it "has many comments" do
#       comment = Comment.create(user: user, body: "superb!", commentable_id: film.id, commentable_type: 'Film')
#       expect(film.comments.first).to eq(comment)
#     end
#   end

#   describe "film ratings" do
#     it "has many ratings" do
#       rating = Rating.create(user: user, value: 5, rateable_id: film.id, rateable_type: 'Film')
#       expect(film.ratings.first).to eq(rating)
#     end
#   end

#   describe "film validations" do
#     it "is valid when it has a title" do
#       film.title = 'generic title'
#       film.valid?
#       expect(film.errors[:title]).to be_empty
#     end

#     it "is NOT valid when it has no title" do
#       film.title = nil
#       film.valid?
#       expect(film.errors[:title]).to_not be_empty
#     end
#   end
end
