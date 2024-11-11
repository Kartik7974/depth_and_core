class User < ApplicationRecord
  has_secure_password
  
  before_save { self.email = email.downcase }
  
  validates :email, presence: true, 
                   uniqueness: { case_sensitive: false },
                   format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
