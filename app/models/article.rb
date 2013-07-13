class Article < ActiveRecord::Base
  attr_accessible :summary, :collaboration_id
  has_many :marks
  belongs_to :collaboration
end
