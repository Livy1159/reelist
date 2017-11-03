require 'rails_helper'

describe Film do
  let(:film) { Film.create(title: "test") }
  let(:category) { Category.create(name: "test") }
  let(:user) { User.create(email: 'test@test.com', username:'test', password: '123')}

  describe "film reviews" do
    it "has many reviews" do
      review = Review.create(film: film, body: "awesome film", user_id: user.id)
        expect(film.reviews.first).to eq(review)
    end

  describe "film categories" do
    it "has many categories" do
      film_category = FilmCategory.create(film: film, category: category)
      expect(film.categories.first).to eq(category)
    end
  end


  describe "film comments" do
    it "has many comments" do
      comment = Comment.create(user: user, body: "superb!")
      expect(film.comments.first).to eq(comment)
    end
  end

#   describe "film ratings" do
#     it "has many ratings" do
#       rating = Rating.create(film: film, rating: 5)
#       expect(film.rating.first).to eq(5)
#     end
#   end

#   describe "film validations" do
#     it "is valid when it has a title" do
#       film.title = 'generic title'
#       film.valid?
#       expect(film.errors[:title]).to be_empty
#     end

#     it "is NOT valid when it has no title" do
#       film.title = 'generic title'
#       film.valid?
#       expect(film.errors[:title]).to_not be_empty
#     end
#   end
  end
end
