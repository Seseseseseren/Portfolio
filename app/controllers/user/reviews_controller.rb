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
    flash[:create] = "レビューが投稿できました！"
    redirect_to request.referer
  end

  def edit
    @review = Review.find(params[:id])
    @subscription = Subscription.find(params[:subscription_id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      flash[:update] = "レビューが更新されました！"
      redirect_to subscription_path(review.subscription), flash: { success: "レビューが更新されました" }
    else
      flash[:failed] = "必要な項目に記入が無いため、更新に失敗しました"
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューが削除されました"
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :title, :rate, :body)
  end
end
