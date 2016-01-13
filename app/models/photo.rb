class Photo < ActiveRecord::Base
  validates :title, presence: true
  validates :image_file, presence: true

  belongs_to :user
  has_many   :ratings

  mount_uploader :image_file, ImageFileUploader

  # validates :title, presence: true

  # class method(s):
  def self.random
    self.order("RANDOM()").first
  end

  # instance method(s):
  def rating_score
    # self.ratings.to_a.sum do |r|
    #   r.rating
    # end

    self.ratings.sum(:rating)
  end

end
