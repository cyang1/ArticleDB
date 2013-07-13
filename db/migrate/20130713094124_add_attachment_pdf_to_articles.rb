class AddAttachmentPdfToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :articles, :pdf
  end
end
