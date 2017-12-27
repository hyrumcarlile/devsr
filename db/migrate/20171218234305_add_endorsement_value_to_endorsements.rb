class AddEndorsementValueToEndorsements < ActiveRecord::Migration[5.0]
  def change
    add_column :endorsements, :endorsement_value, :integer
  end
end
