class House < ApplicationRecord
  belongs_to :user
  has_many :rooms

  validates :location, :size, presence: true
end
