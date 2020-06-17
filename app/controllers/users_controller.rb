class UsersController < ApplicationController
  def new
  end

  def create
    @new_user = User.new(email: params[:email], password: params[:password])

    if @new_user.save # @new_user.valid
      # add session info

      # _path #=> '/houses'
      # _url #=> 'http://localhost:3000/houses'
      redirect_to houses_path
    else
      render :new
    end
  end

  def show
  end
end
