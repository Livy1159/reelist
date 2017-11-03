require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

	describe "GET #index" do
		it "assigns @comments" do
			get :index
			expect(assigns(@comments)).to eq(@film.comments)
		end
	end

end