require 'rails_helper'
describe User do
	context "when creating user" do
		before do
			@user = User.create!(email: "alejandro.ginesmartinez@gmail.com", password: "AGM39432079m")
		end

		it "user cannot be created without an email" do
			expect(User.new).not_to be_valid
		end

		it "created with a not valid formatted email" do
			expect(User.new).to_not be_valid	
		end

		it "password not supplied" do
			expect(User.new).to_not be_valid
		end

		it "all information is valid" do
			expect(@user).to be_valid
		end
	end
end