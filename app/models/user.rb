class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness:true
  validates :email, format: {with: /@/}
  validates :username, presence: true, uniqueness:true

  has_many :photos
  has_many :ratings

  def avatar
    default_url = "http://placekitten.com/300/301"
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
  end

  # add random_photo method

end
