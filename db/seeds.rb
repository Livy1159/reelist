require 'faker'

User.destroy_all
Review.destroy_all
Film.destroy_all
FilmCategory.destroy_all
Comment.destroy_all
Category.destroy_all
Rating.destroy_all

users = 10.times.map do
  User.create!( username:  Faker::Name.first_name,
                    email:       Faker::Internet.email,
                    password:    'password',
                    trusted_reviewer:  Faker::Boolean.boolean)
end

films = ["Forrest Gump", "28 Days Later ", "The Magician", "Titanic",
 "Snakes on a Plane", "Narcos", "Love Story", "Aladdin", "Little Mermaid", "Pulp Fiction"].map do |title|
  Film.create!(title:  title)
end

reviews = 10.times.map do
  Review.create!( body:  Faker::Movie.quote,
                  film_id: Film.all.sample.id,
                  user_id: User.all.sample.id )
end

ratings = 10.times.map do
  type = [Film, Review].sample
  Rating.create!( value: Faker::Number.between(1, 5),
                  rateable_type: type,
                  rateable_id: type.all.sample.id,
                  user_id: User.all.sample.id)
end

comments = 10.times.map do
  type = [Film, Review].sample
  Comment.create!( body: Faker::Movie.quote,
                  commentable_type: type,
                  commentable_id: type.all.sample.id,
                  user_id: User.all.sample.id)
end


categories = ["drama", "comedy ", "thriller", "romantic comedy",
 "documentary", "sports", "depressing", "animated", "musical", "trash"].map do |name|
  Category.create!(name: name)
end


films.each do |film|
  film.categories << categories.sample
end




