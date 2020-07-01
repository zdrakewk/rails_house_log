class House < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy

  validates :location, :size, presence: true
  # accepts_nested_attributes_for :rooms

  def rooms_attributes=(room_params)
    room_params.values.each do |room_attrs| # {"name"=>"Main", "theme"=>"Choas", "use"=>"1"}
      unless room_attrs.values.any?(&:empty?)
        # if !(room_attrs.values.any?(&:empty?))
        # binding.pry
        # new_room = Room.new(room_attrs)
        # self.rooms << new_room
        self.rooms << Room.new(room_attrs)
      end
    end 
  end
end
