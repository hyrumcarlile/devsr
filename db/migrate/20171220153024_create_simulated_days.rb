class CreateSimulatedDays < ActiveRecord::Migration[5.0]
  def change
    create_table :simulated_days do |t|
      t.integer :num_new_users
      t.integer :num_new_endorsements

      t.timestamps
    end
  end
end
