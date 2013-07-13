class UserCollaboration < ActiveRecord::Base
  attr_accessible :collaboration_id, :role, :user_id
  belongs_to :user
  belongs_to :collaboration
end
