require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :auto_login_token
  attr_accessor :password

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
