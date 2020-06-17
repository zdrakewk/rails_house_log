class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    # byebug
   @house = get_house
  end

  def new  
    @house = House.new
    @all_users = User.all
  end

  def create
    @new_house = House.new(house_params)
    if @new_house.save
      redirect_to houses_path
    else
     render :new
    end
  end

  private
  def house_params # selecting house attrs from params
    #params => {auth_token: 123232, house: {location: 'str', size: #, user_id: #}}
    params.require(:house).permit(:location, :size, :user_id)
  end

  def get_house # finding house in table from params
    House.find_by_id(params[:id])
  end

end
