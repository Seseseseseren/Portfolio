class Owner::SubscriptionsController < ApplicationController
  before_action :authenticate_owner!

  def index
    @subscriptions = Subscription.page(params[:page]).per(10)
    @genre_map = Genre.all.map { |genre| [genre.name, genre.id] }
    @genre_map.push(["全て", 0])
  end

  def new
    @subscription = Subscription.new
    @genres = Genre.all
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:success] = "新規登録が完了しました"
      redirect_to owner_subscription_path(@subscription)
    else
      flash[:danger] = "必要な項目に記入が無いため、新規登録に失敗しました"
      redirect_to request.referer
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def edit
    @subscription = Subscription.find(params[:id])
    @genres = Genre.all
  end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update(subscription_params)
      flash[:success] = "更新が完了しましたされました"
      redirect_to owner_subscription_path(@subscription)
    else
      flash[:danger] = "必要な項目に記入が無いため、更新に失敗しました"
      redirect_to request.referer
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to owner_subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:subscription_image, :subscription_name, :genre_id, :subscription_fee, :payment_date)
  end
end
