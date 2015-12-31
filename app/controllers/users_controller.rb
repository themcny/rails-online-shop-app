class UsersController < ApplicationController

  def index
    if current_user && current_user.admin
      @users = User.all
    else
      redirect_to login_path
      session[:errors] = "Login as an admin to view that"
    end
  end

  def show
    if current_user && current_user.id == params[:id]
      @user = User.find(current_user.id)
    elsif current_user && current_user.admin
      @user = User.find(params[:id])
    else
      redirect_to login_path
      session[:errors] = "You must login to view that!"
    end
  end

  def new
    @timezone_array =ActiveSupport::TimeZone.zones_map.values.collect{|z| z.tzinfo.identifier }
    @user = User.new
  end

  def create
    @timezone_array = ActiveSupport::TimeZone.zones_map.values.collect{|z| z.tzinfo.identifier}

    @user = User.new(user_params)
    @user.timezone = params["timezone"]["location"]
    if @user.save
      log_in(@user)
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

  def user_params
    p params
    params.require(:user).permit(:email, :password, :password_confirmation, )
  end
end
