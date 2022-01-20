class Subscription < ApplicationRecord

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :subscription_members

  attachment :subscription_image

  def self.search(search,word)
    if search == "perfect_match"
      @subscriptions = Subscription.where("subscription_name LIKE?","#{word}%")
    elsif search =="partial_match"
      @subscriptions = Subscription.where("subscription_name LIKE?","%#{word}%")
    else
      @subscriptions = Subscription.all
    end
  end

end
