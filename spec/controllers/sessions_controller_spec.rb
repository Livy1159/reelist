require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

describe "POST #create" do
		context "when valid params are passed" do
			it "responds with status code 200" do
				post :create
				expect(response).to have_http_status 200
			end
			it "should create a session" do
				session[:user_id].to be_nil
				post :create, provider: :reelist
				session[:user_id].to_not be_nil
			end
		end
	end
end