require 'rails_helper'

describe UsersController, :type => :controller do
	
	let(:user) { User.create(email: "other@example.net", password: "123456")}
	let(:user2) { User.create(email: "next@email.net", password: "123pass")}

	describe 'GET #show' do

		context 'User is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do

				get :show, id: user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user	
			end
		end

		context 'No user is logged in' do
			it "redirects to login" do
				get :show, id: user.id
				expect(response).to redirect_to(root_path)
			end
		end

		context 'When show page from other user' do
			before do
				sign_in user
			end

			it 'redirects to root' do
				get :show, id: user2.id
				expect(response).to redirect_to(root_path)
				expect(response).to have_http_status(302)
				expect(assigns(:user)).not_to eq user						
			end			
		end

		context 'edit other user' do
			before do
				sign_in user2
			end

			it 'redirects to root' do
				get :edit, id: user.id

				expect(response).not_to be_success
				expect(response).to have_http_status(302)
				expect(assigns(:user)).to eq user
			end	
		end
	end
end