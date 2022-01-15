class Subscription < ApplicationRecord
  
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :subscription_members
  
  attachment :image

  
end
