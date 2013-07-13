class CreateUserCollaborations < ActiveRecord::Migration
  def change
    create_table :user_collaborations do |t|
      t.integer :user_id
      t.integer :collaboration_id
      t.string :role

      t.timestamps
    end
  end
end
