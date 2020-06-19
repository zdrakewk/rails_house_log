class House < ApplicationRecord
  belongs_to :user

  validates :location, :size, presence: true
end
