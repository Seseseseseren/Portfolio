class User::SearchesController < ApplicationController
  
  def search
    # rangeが検索モデルを表し、searchが検索方法、wordが検索に記入したワードとする
    @range = params[:range]
    @word = params[:word]
    search = params[:search]
    
    if @range == '1'
      @subscriptions = Subscription.search(search,@word)
    else
      @genres = Genre.search(search,@word)
    end
  end

end