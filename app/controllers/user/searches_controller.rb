class User::SearchesController < ApplicationController
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

    if params[:subscription].present?
      if params[:subscription][:sort_list] == "updated_at ASC"
        @subscriptions.order!(updated_at: "ASC")
      elsif params[:subscription][:sort_list] == "updated_at DESC"
        @subscriptions.order!(updated_at: "DESC")
      end
    end
    @sort_list = Subscription.sort_list
  end

  def sort
    if sort_params.present?
      @subscriptions = Subscription.sort_subscriptions(sort_params)
    else
      @subscriptions = Subscription.all
    end
    render :search
  end

  private

  def sort_params
    params.require(:subscription).permit(:sort_list)
  end
end
