class Owner::GenresController < ApplicationController
  before_action :authenticate_owner!

  def index
    @genres = Genre.page(params[:page]).per(10)
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:success] = "ジャンルの登録が完了しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "ジャンル登録に失敗しました"
      redirect_to request.referer
    end
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      flash[:success] = "更新が完了しました"
      redirect_to owner_genres_path
    else
      flash[:danger] = "更新に失敗しました"
      redirect_to request.referer
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
