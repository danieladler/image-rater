class Rating < ActiveRecord::Base
  validates :rating, presence: true

  belongs_to :photo
  belongs_to :user

  def username
    self.user.username
  end

  def formatted_comment
    # absract code from photo 'show' view, for comments on each photo w/ link to username, into here
  end

end
