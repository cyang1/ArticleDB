class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest
	attr_accessible :password, :password_confirmation

  has_secure_password
	validates_presence_of :password, :password_confirmation, :on => :create
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
end
