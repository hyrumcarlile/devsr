class AddModelsToSimulatedDay < ActiveRecord::Migration[5.0]
  def change
    add_column :simulated_days, :num_new_notes, :int
    add_column :simulated_days, :num_new_votes, :int
  end
end
