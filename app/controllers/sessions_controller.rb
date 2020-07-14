class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by(email: session_params[:email])
    binding.pry

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to houses_path
    else
      # redirect_to login_path
      render :login
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

  def github
    # binding.pry

    user = User.find_or_create_by(uid: github_params['uid']) do |u|
      u.username = github_params['info']['name'] || github_params['info']['nickname']
      u.email = github_params['info']['email']
      u.password = github_params['credentials']['token']
    end
 
    session[:user_id] = user.id
 
    redirect_to houses_path
  end

  private
  def session_params
    params.require('session').permit(:email, :password)
  end

  def github_params
    request.env['omniauth.auth']
  end
end
