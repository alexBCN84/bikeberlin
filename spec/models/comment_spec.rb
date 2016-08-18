require 'rails_helper'
describe Comment do
	context "when creating comment" do
		before do
			@product = Product.create!(name: "Best bike", price: "3435") 
  		@user = User.create!(email: "alejandro.ginesmartinez@gmail.com", password: "AGM39432079m")
		end

		it "comment not valid because of body missing" do
			@comment = Comment.new(user: @user, product: @product, rating: 3)
			expect(@comment).not_to be_valid
		end

		it "comment not valid because of user missing" do
			@comment = Comment.new(body: "This is an absolutely excellent product", product: @product, rating: 3)
			expect(@comment).not_to be_valid
		end

		it "comment not valid because of rating missing" do
			@comment = Comment.new(user: @user, body: "This is an absolutely excellent product", product: @product)
			expect(@comment).not_to be_valid
		end

		it "comment valid" do
			expect(Comment.new(user: @user, product: @product, body: "This is an absolutely excellent product", rating: 3)).to be_valid
		end
	end
end