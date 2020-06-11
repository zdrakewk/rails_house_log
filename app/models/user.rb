class User < ApplicationRecord
  has_many :houses

  validates :email, presence: true 
  has_secure_password
end
