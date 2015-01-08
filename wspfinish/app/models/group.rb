class Group < ActiveRecord::Base
  #attr_accessible :name
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy

  validates :name, presence: true
end
