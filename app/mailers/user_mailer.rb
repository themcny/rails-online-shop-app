class UserMailer < ApplicationMailer
  default from: "sadshopdefault@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
