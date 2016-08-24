require 'rails_helper'

describe UsersController, :type => :controller do # functional test file for users_controller.rb

	
	before do
		#FIxture for creating test user
		#@user = User.create(email: "next@email.net", password: "123pass", first_name: "Pedro", last_name: "Corral")
		#@user2 = User.create(email: "last@email.net", password: "456pass", first_name: "Frank", last_name: "Kafka")
		@user = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user2)
	end

	describe 'GET #show' do # everything inside this block will happen in the show action

		context 'User is logged in' do
			before do
				sign_in @user
			end

			it 'loads correct user details' do

				get :show, id: @user.id
				expect(response).to be_success
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user	
			end
		end

		context 'No user is logged in' do
			it "redirects to login page" do # a show page always needs an ID; here we define the ID to be equal the ID of the user
				get :show, id: @user.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'when @user trying to access the @user2 show page' do
			before do
				sign_in @user
			end

			it 'redirects user to login page' do
				get :show, id: @user2.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user2						
			end			
		end

		context 'when @user trying to edit @user2' do
			before do
				sign_in @user2
			end

			it 'redirects user to login page' do
				get :edit, id: @user2.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user2
			end	
		end
	end
end