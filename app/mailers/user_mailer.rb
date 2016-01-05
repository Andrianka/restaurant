class UserMailer < ActionMailer::Base
  default from: "wsiz.restaurant@gmail.com"

  def welcome(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Your password")
  end
end
