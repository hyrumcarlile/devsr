class AddEndorsementValueToEndorsements < ActiveRecord::Migration[5.0]
  def change
    add_column :endorsements, :endorsement_value, :decimal, precision: 10, scale: 5, default: 0
  end
end
