class SessionController < ApplicationController
  def new

  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      # try again message here
      redirect_to login_path # GET /login
    end
  end

  def edit
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path # GET /login
  end
end