class ChargesController < ApplicationController



require "stripe"
Stripe.api_key = ENV['STRIPE_SECRET_KEY']


 def create
 
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken],
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: Amount.premium_charge,
     description: "Wikirator Premium - #{current_user.email}",
     currency: 'usd'
   )
 
 
   flash[:notice] = "Thank you #{current_user.email}. Enjoy Wikirator premium!"
  
    current_user.premium!
 
   redirect_to root_path
 
 
   
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
      redirect_to root_path
 
 end
 
 
 def new
  

     @stripe_btn_data = {
     key: ENV['STRIPE_PUBLISHABLE_KEY'],
     description: "Wikirator Premium - #{current_user.email}",
     amount: Amount.premium_charge
   }
   
   
   
 end


end
