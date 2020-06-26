class HousesController < ApplicationController
before_action :get_house, only: [:show, :edit, :update, :destroy]
# before_action :is_logged?, except: [:index, :show]

  def index
    # binding.pry
    if params.include?('user_id') #|| !!params[:user_id] || params[:user_id]
      # current_user = user
      # @houses = user.houses
      # @houses = current_user.houses
      @houses = User.find_by_id(params[:user_id]).houses
    else
      @houses = House.all
    end
    # render :'folder/file_name'
  end

  def show
    # binding.pry
    if params.include?('user_id') #|| !!params[:user_id] || params[:user_id]
      # current_user = user
      # @houses = user.houses
      # @houses = current_user.houses
      @house = User.find_by_id(params[:user_id]).houses.find_by_id(params[:id])
    end
  # @house = get_house
  end

  def new
    # binding.pry
    if params.include?('user_id')
      @house = User.find_by_id(params[:user_id]).houses.new
      @house = User.find_by_id(params[:user_id]).houses.build
    else
      @house = House.new
    end
    # @all_users = User.all
  end

  def create
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
  # @house = get_house
   if @house.update(house_params)
     redirect_to house_path(@house)
   else
     @all_users = User.all
    render :edit
   end

    @all_users = User.all
  end

  def destroy
    # @house = get_house
    @house.destroy
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
      @house = House.find_by_id(params[:id])
      # House.find(params[:id])
    end
end
