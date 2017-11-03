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
	 # describe "GET #show/:id" do
	 # 	# context "finds a film by id" do
	 # 		get :show, id:
	 # 		it "renders a film" do
	 # 		expect(response).to redirect_to(:show)
	 # 	end
	 # end
  # end
 
    	  
end