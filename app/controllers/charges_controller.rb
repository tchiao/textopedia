class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Textopedia Premium - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "You are officially a member of the elite Premium club! Thanks for joining."
    current_user.update_attributes(plan: 'premium')
    redirect_to user_path(current_user)

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
