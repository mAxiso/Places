class User < ActiveRecord::Base
  has_many :places
  has_secure_password
   attr_accessible :email, :username, :password, :password_confirmation
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def encrypt_password
	if password.present?
  		self.password_salt = BCrypt::Engine.generate.salt
		self.password_hash = BCrypt::Engine.generate.hash_secret(password, password_salt)
	end
  end

end
