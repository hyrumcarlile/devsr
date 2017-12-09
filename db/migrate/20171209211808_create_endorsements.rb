class CreateEndorsements < ActiveRecord::Migration[5.0]
  def change
    create_table :endorsements do |t|
      t.integer :endorser_id
      t.integer :endorsee_id

      t.timestamps
    end
    add_index :endorsements, :endorser_id
    add_index :endorsements, :endorsee_id
    # a user can't follow another user more than once.
    add_index :endorsements, [:endorser_id, :endorsee_id], unique: true
  end
end
