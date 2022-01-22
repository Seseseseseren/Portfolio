class Subscription < ApplicationRecord

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :subscription_members

  attachment :subscription_image
# searchに飛んだ時の分岐、基本elseには飛ばないけど念のため記述
  def self.search(search,word)
    if search == "perfect_match"
      @subscriptions = Subscription.where("subscription_name LIKE?","#{word}")
    elsif search =="partial_match"
      @subscriptions = Subscription.where("subscription_name LIKE?","%#{word}%")
    else
      @subscriptions = Subscription.all
    end
  end

# searchWithGenreに飛んだ時の分岐、elseには飛ばないけど念の為記述
  def self.searchWithGenre(search,word,genre)
    if search == "perfect_match"
      @subscriptions = Subscription.where(genre_id:genre).where("subscription_name LIKE?","#{word}")
    elsif search =="partial_match"
      @subscriptions = Subscription.where(genre_id:genre).where("subscription_name LIKE?","%#{word}%")
    else
      @subscriptions = Subscription.where(genre_id:genre)
    end
  end

end
