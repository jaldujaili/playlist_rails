class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :playlists

  # validates_uniquesness_of :email



  before_validation :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
      end while self.class.exists?(auth_token: auth_token)
  end

  def self.token_authenticate!(token)
    User.where(auth_token: token).first
  end
end
