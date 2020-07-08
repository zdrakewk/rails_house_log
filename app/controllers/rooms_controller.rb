class RoomsController < ApplicationController

  def new
    @room = Room.new
    @room.build_house
    @houses = House.all
  end

  def create
    @new_room = Room.new(room_params)
    @new_room.house.user = current_user 
    @new_room.save!
    # binding.pry
    redirect_to house_path(@new_room.house)
  end

  private

  def room_params
    params.require(:room).permit(:name, :theme, :use, :house_id, house_attributes: [:location, :size, :user_id]
    )
  end
end
