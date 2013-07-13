class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest
	attr_accessible :password, :password_confirmation

  has_secure_password
	validates_presence_of :password, :on => :create
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  has_many :user_collaborations
  has_many :collaborations, :through => :user_collaborations
  has_many :marks
  has_many :articles, :through => :marks
end
