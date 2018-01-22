class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :is_upvote?
      t.integer :user_id, foreign_key: true
      t.integer :note_id, foreign_key: true

      t.timestamps
    end
  end
end
