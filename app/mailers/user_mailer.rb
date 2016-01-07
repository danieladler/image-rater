class UserMailer < ApplicationMailer

  def subscribe(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Welcome to ImageRater!")
  end

end
