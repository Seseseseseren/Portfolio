class Genre < ApplicationRecord
  
  has_many :subscriptions
  validates :name,presence:true

end
