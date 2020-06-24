class HousesController < ApplicationController
  def index
    @houses = House.all
    # render :'folder/file_name'
  end

  def show
    # byebug
   @house = get_house
  end

  def new
    @house = House.new
    # @all_users = User.all
  end

  def create
    # @new_house = House.new(house_params)

    #  binding.pry
    # if @new_house.save
    #   redirect_to houses_path
      # set foreign key
      # house.user_id = session[:user_id]

    # @new_house = House.new(house_params)
    # if current_user.houses << @new_house
    # #  redirect_to house_path(current_user.houses.last)
    #  redirect_to house_path(@new_house)

    # binding.pry
    @new_house = current_user.houses.build(house_params)

    if @new_house.save
      redirect_to house_path(@new_house)
    else
      # @all_users = User.all
     render :new
    end
  end

  def edit
    # @house = get_house
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
    #params => {
    # auth_token: 123232,
    # house: {location: 'str', size: #, user_id: #, house_type: ''}
    # }
    params.require(:house).permit(:location, :size)
  end

  def get_house # finding house in table from params
    House.find_by_id(params[:id])
  end

end
