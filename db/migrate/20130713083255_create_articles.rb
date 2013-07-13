class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :summary
      t.integer :collaboration_id

      t.timestamps
    end
  end
end
