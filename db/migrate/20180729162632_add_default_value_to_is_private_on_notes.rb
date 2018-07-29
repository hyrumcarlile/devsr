class AddDefaultValueToIsPrivateOnNotes < ActiveRecord::Migration[5.0]
  def up
    change_column :notes, :is_private, :boolean, default: false
  end

  def down
    change_column :notes, :is_private, :boolean
  end
end
