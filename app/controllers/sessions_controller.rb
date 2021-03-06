class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:login, :create]

  def login
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}"
      redirect_to root_path
    else
      flash[:danger] = "Sorry no user found with those credentials!"
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out! Goodbye"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:danger] = "Already logged in!"
      redirect_to root_path
    end
  end

end
