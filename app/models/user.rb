require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :lists

  validates :username, presence: true
  validates :email, presence: true
  validates_presence_of :password, :on => :create

  has_secure_password

end
