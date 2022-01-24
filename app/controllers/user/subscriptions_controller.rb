class User::SubscriptionsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
    @subscriptions = Subscription.all
    @genre_map =  Genre.all.map { |genre| [genre.name, genre.id] }
    @genre_map.push(["全て", 0])
  end
# genre_mapはgenreのテーブルから必要な情報を取ってくる
# genre_map.pushはデータベースに入っていないかつデフォルトの設定で使用するため記述

  def show
    @subscription = Subscription.find(params[:id])
    @review = Review.new
    @reviews = @subscription.reviews
  end

end

