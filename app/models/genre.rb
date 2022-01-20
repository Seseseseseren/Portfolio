class Genre < ApplicationRecord

  has_many :subscriptions
  validates :name,presence:true

  def self.search(search,word)
    if search == "perfect_match"
      @genres = Genre.where("name LIKE?","%#{word}%")
    elsif search =="partial_match"
      @genres = Genre.where("name LIKE?","%#{word}%")
    else
      @genres = Genre.all
    end
  end

end
