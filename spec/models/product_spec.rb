require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do   
  		@product = Product.create!(name: "Best bike", price: "3435") 
  		@user = User.create!(email: "alejandro.ginesmartinez@gmail.com", password: "AGM39432079m")
  		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
  		@product.comments.create!(rating: 3, user: @user, body: "Excellent bike to ride in the city")
  		@product.comments.create!(rating: 5, user: @user, body: "Most amazing bike I've ever had")
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq (3)
		#Expect the product's average rating to equal 3
		end

		it "is not valid" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end