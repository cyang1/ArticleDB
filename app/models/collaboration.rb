class Collaboration < ActiveRecord::Base
  attr_accessible :name, :private
  has_many :user_collaborations
  has_many :articles
end
