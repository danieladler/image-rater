class Rating < ActiveRecord::Base

  belongs_to :photo
  belongs_to :user

  def username
    self.user.username
  end

end
