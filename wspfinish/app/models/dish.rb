class Dish < ActiveRecord::Base
  

  belongs_to :group

  has_many :line_items

  # validates :img_url, presence: true
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :statu, presence: true
  # validates :group_id, presence: true

  def restaurant
    group.restaurant
  end
end
