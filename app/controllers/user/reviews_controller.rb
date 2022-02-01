class User::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def create
    @review = Review.new(review_params)
    @review.score = Language.get_data(review_params[:body]) #google api
    @subscription = Subscription.find(params[:subscription_id])
    @review.subscription_id = @subscription.id
    @review.user_id = current_user.id
    if Review.find_by(user_id: current_user.id, subscription_id: @subscription.id).nil?
      if @review.save
        flash[:success] = "レビューが投稿できました！"
        redirect_to subscription_path(@review.subscription)
      else
        flash[:failed] = "必要事項に記入が無いため投稿できませんでした。"
        redirect_to request.referer
      end
    else
      flash[:danger] = "既にレビューしているため、投稿できませんでした。"
      redirect_to request.referer
    end
  end

  def edit
    @review = Review.find(params[:id])
    @subscription = Subscription.find(params[:subscription_id])
  end

  def update
    review = Review.find(params[:id])
    review.score = Language.get_data(review_params[:body]) #google api
    if review.update(review_params)
      flash[:success] = "レビューが更新されました！"
      redirect_to subscription_path(review.subscription)
    else
      flash[:danger] = "必要な項目に記入が無いため、更新に失敗しました。"
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:danger] = "レビューが削除されました。"
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :title, :rate, :body)
  end
end
