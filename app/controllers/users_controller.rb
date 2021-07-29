class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    if @current_user.present?
      @user = @current_user
      render :settings
    else redirect_to login_path
    end
  end

  def view
    begin
      @user = User.find params[:id]
    rescue 
      redirect_to root_path
    else
      render :view
    end
  end
  
  def create
    @user = User.new user_params
    if @user.save # returns true on success
      session[:user_id] = @user.id
      redirect_to "/feeds/new"
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
