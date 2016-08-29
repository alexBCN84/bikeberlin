class PaymentsController < ApplicationController
	# POST /payments/payment_created
	def create
		#declaring instance variable to find product by reading hidden field's params in the stripe checkout button form.
		@product = Product.find(params[:product_id])
		#declaring instance variable to refer to the current user by using Devise helper.
		@user = current_user

		# Geting credit card details submitted by the form
		token = params[:stripeToken]
  	# Create the charge on Stripe's servers - this will charge the user's card
  	begin
    	charge = Stripe::Charge.create(
    		#We access product's price via instance variable @product
      	:amount => @product.price.to_i*100,
      	:currency => "eur",
      	:source => token,
      	:description => params[:stripeEmail]
    	)
  	# Checking whether the payment has been successfull
    # .paid is a method provided by Stripe
    # If payment was successfull, the order is being created
    if charge.paid
      Order.create(
        :product_id => @product,
        :user_id => @user,
        :total => @product.price
      )

    	flash[:success] = "Payment successful"
 			redirect_to "payments/payment_successful.html.erb"


    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
    end
  end
end