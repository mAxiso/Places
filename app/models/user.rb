class User < ActiveRecord::Base
  has_many :places
  has_secure_password
  attr_accessible :email, :username, :password, :password_confirmation
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
