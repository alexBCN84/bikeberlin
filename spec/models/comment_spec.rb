require 'rails_helper'
describe Comment do
	context "when creating comment" do
		before do
			@product = Product.create!(name: "Best bike", price: "3435") 
  		@user = User.create!(email: "alejandro.ginesmartinez@gmail.com", password: "AGM39432079m")
			@comment = Comment.create!(user: @user, product: @product, body: "This is an absolutely excellent product", rating: 3)
		end

		it "comment not valid because of body missing" do
			expect(Comment.new(body: "")).not_to be_valid
		end

		it "comment not valid because of user_id missing" do
			expect(Comment.new(user_id:"")).to_not be_valid	
		end

		it "comment not valid because of rating missing" do
			expect(Comment.new(rating:"")).to_not be_valid	
		end

		it "comment valid" do
			expect(@comment).to be_valid
		end
	end
end