require 'rails_helper'

describe User do
  let(:user) { User.create(email: "bob@bob.com", username: "bobby", password: "bob") }
  let(:film) { Film.create(title: "Sandlot") }
  let(:comment) { Comment.create(body: "nice!", user_id: 1, commentable_type: "Film", commentable_id: 1) }
  let(:rating) { Rating.new(value: 5, user_id: 1) }

  context "when input is valid" do
    it "saves user to the database" do
      expect(User.all).to eq [user]
    end

    it "has an email" do
      expect(user.email).to eq "bob@bob.com"
    end

    it "has a username" do
      expect(user.username).to eq "bobby"
    end

    it "has a password" do
      expect(user.password).to eq "bob"
    end

    it "has many comments" do
      expect(user.comments).to eq [comment]
    end
  end

  context "when input is invalid" do
    it "does not save user to the database" do
      user2 = User.create(email: "", username: "sam", password: "samsam")
      user3 = User.create(email: "tim", username: "tim", password: "")
      expect(User.all).to eq [user]
    end
  end
end

