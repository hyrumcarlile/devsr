class CreateEndorsements < ActiveRecord::Migration[5.0]
  def change
    create_table :endorsements do |t|
      t.integer :endorser_id, foreign_key: true
      t.integer :endorsee_id, foreign_key: true
      t.integer :skill_id,    foreign_key: true

      t.timestamps
    end
    add_index :endorsements, :endorser_id
    add_index :endorsements, :endorsee_id
    # a user can't endorse user more than once for the same skill.
    add_index :endorsements, [:endorser_id, :endorsee_id, :skill_id], unique: true
  end
end
