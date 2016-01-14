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

  def ratings_digest
    if self.ratings
       self.rating_score.to_s +
       "Bad:  #{self.ratings.where(rating:1).count} ".to_s +
       "Meh:  #{self.ratings.where(rating:2).count} ".to_s +
       "Good: #{self.ratings.where(rating:3).count} ".to_s
    end
  end

  def bad_ratings_count
    self.ratings.where(rating:1).count
  end

  def meh_ratings_count
    self.ratings.where(rating:2).count
  end

  def good_ratings_count
    self.ratings.where(rating:3).count
  end
end
