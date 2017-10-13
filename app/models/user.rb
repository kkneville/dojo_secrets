

class User < ActiveRecord::Base
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]+)\z/i	
  has_secure_password
  validates :firstname, :lastname, presence: :true
  validates :email, presence: :true, uniqueness: :true, format: {with: email_regex}

  	before_save do 
		self.email = email.downcase!
	end	

	


end
