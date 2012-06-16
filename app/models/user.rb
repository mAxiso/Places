class User < ActiveRecord::Base
  has_many :places
  attr_accessible :email, :username
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
