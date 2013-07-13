class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.string :name
      t.boolean :private

      t.timestamps
    end
  end
end
