class CarController < ApplicationController
  before_action :check_user, only: [:buy]

  def index
    @cars = Car.all
  end

  def check_user
    if current_user.nil?
      flash[:error] = "You need to login"
      redirect_to new_user_session_path
    end
  end

  def buy
    # Amount in cents
    @amount = params[:price].to_i * 100

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end
