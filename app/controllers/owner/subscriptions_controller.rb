class Owner::SubscriptionsController < ApplicationController
  before_action :authenticate_owner!

  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
    @genres = Genre.all
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to owner_subscription_path(@subscription)
    else
      render :new
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
      redirect_to owner_subscription_path(@subscription)
    else
      render :edit
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:image, :subscription_name, :genre_id, :subscription_fee, :payment_date)
  end

end