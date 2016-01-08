class Photo < ActiveRecord::Base
  belongs_to :user
  has_many   :ratings

  mount_uploader :image_file, ImageFileUploader

  # validates :title, presence: true

  # class method(s):
  def self.random
    self.order("RANDOM()").first
  end

  # instance method(s):

end
