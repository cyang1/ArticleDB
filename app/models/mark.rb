class Mark < ActiveRecord::Base
  attr_accessible :article_id, :comment, :highlight_end_line, :highlight_end_offset, :highlight_start_line, :highlight_start_offset, :user_id
  belongs_to :article
  belongs_to :user

  scope :for_article, lambda{ |id| where(article_id: id) unless id.nil? || id.blank? }
  scope :for_user, lambda{ |id| where(user_id: id) unless id.nil? || id.blank? }

end
