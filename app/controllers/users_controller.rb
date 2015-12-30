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

    @timezones = {
    "UTC-12:00" => -12,
    "UTC-11:00" => -11,
    "UTC-10:00" => -10,
    "UTC-09:00" => -9,
    "UTC-08:00" => -8,
    "UTC-07:00" => -7,
    "UTC-06:00" => -6,
    "UTC-05:00" => -5,
    "UTC-04:00" => -4,
    "UTC-03:00" => -3,
    "UTC-02:00" => -2,
    "UTC-01:00" => -1,
    "UTC-00:00" => 0,
    "UTC+01:00" => 1,
    "UTC+02:00" => 2,
    "UTC+03:00" => 3,
    "UTC+04:00" => 4,
    "UTC+05:00" => 5,
    "UTC+06:00" => 6,
    "UTC+07:00" => 7,
    "UTC+08:00" => 8,
    "UTC+09:00" => 9,
    "UTC+10:00" =>10,
    "UTC+11:00" =>11,
    "UTC+12:00" =>12,
    "UTC+13:00" =>13,
    "UTC+14:00" =>14,
    }
    @user = User.new
  end

  def create
    @user = User.new(params[:user])    # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
end
