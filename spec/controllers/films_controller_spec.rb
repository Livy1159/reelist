require 'rails_helper'

RSpec.describe FilmsController, type: :controller do

	describe "GET #index" do
		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

		it "renders the :index template" do
			get :index
			expect(response).to render_template(:index)
		end
	end
	 describe "GET #show" do
	 	context "finds a film by id" do
	 		it "renders a film " do
	 		expect(response). to render_template(:show)
	 	end
	 end
 
    end		  
end