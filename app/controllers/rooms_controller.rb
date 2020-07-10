class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @room.build_house
    @houses = current_user.houses
  end

  def create
    @new_room = Room.new(room_params)
    @new_room.house.user = current_user unless @new_room.house.user
    # @new_room.house.user = current_user if !(@room.house)
    binding.pry
    @new_room.save!
    redirect_to house_path(@new_room.house)
  end

  def destroy
    room = Room.find_by_id(params[:id])
    past_house = room.house

    room.destroy
    redirect_to house_path(past_house)
  end

  private

  def room_params
    params.require(:room).permit(:name, :theme, :use, :house_id, house_attributes: [:location, :size, :user_id]
    )
  end
end
