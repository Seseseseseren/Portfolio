class User::ReviewsController < ApplicationController

  def create
    @subscription = Subscription.find(params[:subscription_id])
    @review = current_user.reviews.new(review_params)
    @review.subscription_id = @subscription.id
    @review.save
    redirect_to request.referer
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer
  end

    private
  def review_params
    params.require(:review).permit(:title, :rate, :body)
  end
  
end
