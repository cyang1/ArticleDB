class Collaboration < ActiveRecord::Base
  attr_accessible :name #, :private Hide this from mass assignment
  has_many :user_collaborations
  has_many :users, :through => :user_collaborations
  has_many :articles
end
