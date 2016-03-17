require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :lists

  validates :username, presence: true

  has_secure_password

end
