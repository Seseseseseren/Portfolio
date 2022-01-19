class User::SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = Subscription.all
  end
  
  def show
    @subscription = Subscription.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end
  
  #private
  #def review_params
   # params.require(:review).permit(:title, :rate, :body)
  #end
  
  
end

