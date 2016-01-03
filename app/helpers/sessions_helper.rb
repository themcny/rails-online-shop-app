module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    Cart.find_or_create_by(id: user.id)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    CartProduct.destroy_all
    @current_user = nil
  end
end
