class SessionsController < ApplicationController
  def login
  end

  def create
    # binding.pry
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to houses_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

  private
  def session_params
    params.require('session').permit(:email, :password)
  end
end
