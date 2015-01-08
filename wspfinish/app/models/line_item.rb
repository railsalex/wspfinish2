class LineItem < ActiveRecord::Base
  #attr_accessible :dish_id, :restaurant_id, :user_id
  belongs_to :dish
  belongs_to :cart
  has_one :restaurant
  has_one :user
  validates :dish_id, presence: true
  validates :restaurant_id, presence: true
  validates :user_id, presence: true
end
