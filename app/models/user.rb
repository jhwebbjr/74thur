class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_accessor :avatar_url, :email, :name, :password, :password_confirmation, :username
  before_validation :prep_email
  before_save :create_avatar_url

  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  end

  has_secure_password

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  private def prep_email
    self.email = self.email.strip.downcase if self.email
  end
end
