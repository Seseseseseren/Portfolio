class User::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @subscription = Subscription.find(params[:subscription_id])
    @review.subscription_id = @subscription.id
    @review.user_id = current_user.id
    @review.save
   
    redirect_to request.referer
  end

  def edit
    @review = Review.find(params[:id])
    @subscription = Subscription.find(params[:id])
  end

  def update
  review = Review.find(params[:id])
  if review.update(review_params)
    redirect_to subscription_path(review.subscription)
  else
    redirect_to request.referer
  end
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