class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
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
      redirect_to users_path
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
