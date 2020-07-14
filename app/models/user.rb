class User < ApplicationRecord
  has_many :houses

  validates :email, presence: true, unless: :uid
  has_secure_password

  def display_userName
    self.username.capitalize if self.username
  end
end
