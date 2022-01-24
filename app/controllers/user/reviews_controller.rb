class User::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def create
    @review = Review.new(review_params)
    @subscription = Subscription.find(params[:subscription_id])
    @review.subscription_id = @subscription.id
    @review.user_id = current_user.id
    if Review.find_by(user_id: current_user.id, subscription_id: @subscription.id).nil?
      @review.save!
    end
    redirect_to request.referer, notice:"レビューが投稿できました！"
  end

  def edit
    @review = Review.find(params[:id])
    @subscription = Subscription.find(params[:subscription_id])
  end

  def update
  review = Review.find(params[:id])
  if review.update(review_params)
    redirect_to subscription_path(review.subscription), notice:"レビューが更新されました！"
  else
    redirect_to request.referer
  end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer, notice:"レビューが削除されました"
  end

    private
  def review_params
    params.require(:review).permit(:user_id, :title, :rate, :body)
  end

end