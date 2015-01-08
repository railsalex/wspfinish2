class User < ActiveRecord::Base
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALIDATE_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 
  validates :password, presence: true, length: { minimum: 6 }
  #validates :telephone, format: { with: /\A[\d]{11}\z/ }
  validates :address, length: { maximum: 100 }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
