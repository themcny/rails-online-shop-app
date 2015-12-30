class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
  end

  def new
    @timezone_array = ["UTC-12:00", "UTC-11:00", "UTC-10:00", "UTC-09:00",
                       "UTC-08:00", "UTC-07:00", "UTC-06:00", "UTC-05:00",
                       "UTC-04:00", "UTC-03:00", "UTC-02:00", "UTC-01:00",
                       "UTC-00:00", "UTC+01:00", "UTC+02:00", "UTC+03:00",
                       "UTC+04:00", "UTC+05:00", "UTC+06:00", "UTC+07:00",
                       "UTC+08:00", "UTC+09:00", "UTC+10:00", "UTC+11:00",
                       "UTC+12:00", "UTC+13:00", "UTC+14:00"]
    @user = User.new
  end

  def create
    @timezone_array = ["UTC-12:00", "UTC-11:00", "UTC-10:00", "UTC-09:00",
                       "UTC-08:00", "UTC-07:00", "UTC-06:00", "UTC-05:00",
                       "UTC-04:00", "UTC-03:00", "UTC-02:00", "UTC-01:00",
                       "UTC-00:00", "UTC+01:00", "UTC+02:00", "UTC+03:00",
                       "UTC+04:00", "UTC+05:00", "UTC+06:00", "UTC+07:00",
                       "UTC+08:00", "UTC+09:00", "UTC+10:00", "UTC+11:00",
                       "UTC+12:00", "UTC+13:00", "UTC+14:00"]
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to users_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
