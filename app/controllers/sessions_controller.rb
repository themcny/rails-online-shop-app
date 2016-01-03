class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to products_path
    else
      session[:errors] = "Incorrect email or password"
      render 'new'
      session[:errors] = nil
    end
  end

  def destroy
    log_out
    redirect_to products_path
  end


end
