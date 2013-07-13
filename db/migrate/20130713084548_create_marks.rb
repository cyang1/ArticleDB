class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :comment
      t.integer :highlight_start_line
      t.integer :highlight_start_offset
      t.integer :highlight_end_line
      t.integer :highlight_end_offset

      t.timestamps
    end
  end
end
