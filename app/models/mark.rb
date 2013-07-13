class Mark < ActiveRecord::Base
  attr_accessible :article_id, :comment, :highlight_end_line, :highlight_end_offset, :highlight_start_line, :highlight_start_offset, :user_id
  belongs_to :article
  belongs_to :user
end
