class Owner::SearchesController < ApplicationController
  def search
    @word = params[:word] || params[:subscription][:word]
    @genre = params[:genre] || params[:subscription][:genre]
    search = params[:search] || params[:subscription][:search]

    # ０ならsearch、それ以外ならsearchWithGenreへ飛ぶ
    if @genre == '0'
      @subscriptions = Subscription.search(search, @word)
    else
      @subscriptions = Subscription.searchWithGenre(search, @word, @genre)
    end
  end
end
