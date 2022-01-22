class User::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @genre = params[:genre]
    search = params[:search]
# ０ならsearch、それ以外ならsearchWithGenreへ飛ぶ
    if @genre == '0'
      @subscriptions = Subscription.search(search,@word)
    else
      @subscriptions = Subscription.searchWithGenre(search,@word,@genre)
    end
  end

end