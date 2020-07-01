class Room < ApplicationRecord
  belongs_to :house

  validates :name, :theme, :use, presence: true
end
