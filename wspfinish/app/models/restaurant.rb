class Restaurant < ActiveRecord::Base
  # attr_accessor :address, :img_url, :name, :telephone, :logo, :start_time, :end_time
                
  has_many :groups, dependent: :destroy
  has_many :dishes, through: :groups
  has_and_belongs_to_many :carts

   before_save :set_default_image_url
  # validates :address, presence: true
  # validates :img_url, presence: true
  # validates :name, presence: true
  # validates :telephone, presence: true
  # validates :logo, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true
  
  private

  def set_default_image_url
    (self.img_url = "restaurants_images/restaurant1.png") unless self.img_url
    (self.logo = "restaurants_logos/default_restaurant_logo.jpg") unless self.logo
  end
end