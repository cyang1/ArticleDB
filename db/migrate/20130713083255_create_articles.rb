class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :summary
      t.string :name
      t.integer :collaboration_id

      t.timestamps
    end
  end
end
