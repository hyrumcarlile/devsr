class AddIsPrivateToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :is_private, :boolean
  end
end
