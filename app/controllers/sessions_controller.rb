class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to products_path
    else
      render 'new'
    end
  end


  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
