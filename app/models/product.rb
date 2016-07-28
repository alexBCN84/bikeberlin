class Product < ActiveRecord::Base

	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :name, presence: true
	validates :price, numericality: { :greater_than => 0}

	def average_rating
		comments.average(:rating).to_f
	end

end
