class Photo < ActiveRecord::Base

  belongs_to :user
  has_many   :ratings

  # class method(s):
  def self.random
    self.order("RANDOM()").first
  end

  # instance method(s):

end
