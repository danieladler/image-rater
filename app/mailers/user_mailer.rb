class UserMailer < ApplicationMailer

  def subscribe(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Welcome to ImageRater!")
  end

  def reviewed(photographer_id,reviewer_id,rating_id) #possible to add review object here as well- to include review text?
    @photographer = User.find(photographer_id)
    @reviewer     = User.find(reviewer_id)
    @rating       = Rating.find(rating_id)
    mail(to:@photographer.email, subject: "One of your photos was reviewed")
  end

end
