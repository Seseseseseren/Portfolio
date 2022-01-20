class User::SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = Subscription.all
  end
  
  def show
    @subscription = Subscription.find(params[:id])
    @review = Review.new
    @reviews = @subscription.reviews
  end
  
end

