class Article < ActiveRecord::Base
  attr_accessible :name, :summary, :collaboration_id, :pdf
  
  
  has_many :marks
  belongs_to :collaboration
	has_attached_file :pdf, :default_url => ":rails_root/public/missing.pdf",
  	:url => "/system/:class/:attachment/:id/:basename.:extension",
  	:path => ":rails_root/public/system/:class/:attachment/:id/:basename.:extension"

	validates_attachment :pdf, :presence => true, 
		:content_type => { :content_type => "application/pdf" }, 
		:size => { :in => 0..10.megabytes }
end
