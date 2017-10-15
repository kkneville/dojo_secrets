

class User < ActiveRecord::Base
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]+)\z/i	
  has_secure_password
  validates :firstname, :lastname, :email, presence: :true
  validates :email, uniqueness: :true, format: {with: email_regex}
  before_save :downcase_email

  def downcase_email
  	self.email.downcase
  end 
  	
end
