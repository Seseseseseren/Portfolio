class Subscription < ApplicationRecord

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :subscription_members

  attachment :subscription_image


end
