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
     binding.pry
    if @new_house.save
      redirect_to houses_path
    else
      @all_users = User.all
     render :new
    end
  end

  def edit
    @house = get_house
    @all_users = User.all
  end

  def update
    @house = get_house
   if @house.update(house_params)
     redirect_to house_path(@house)
   else
     @all_users = User.all
    render :edit
   end

    @all_users = User.all
  end

  def destroy
    house = get_house
    house.destroy
    redirect_to houses_path
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
