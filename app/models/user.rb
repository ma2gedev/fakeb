require 'bcrypt'

class User < ActiveRecord::Base
  has_many :bookmarks
  attr_accessible :name, :password_digest, :auto_login_token, :password, :password_confirmation
  attr_accessor :password

  validates :name, :presence => true, :length => { :maximum => 20 },
    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 4, :allow_blank => true },
    :confirmation => true
  validates :password_confirmation, :presence => true

  before_save do
    self.password_digest = BCrypt::Password.create(password)
  end

  before_create do
    self.auto_login_token = SecureRandom.hex
  end

  def authenticate(unencrypted_password)
    BCrypt::Password.new(password_digest) == unencrypted_password
  end
end
