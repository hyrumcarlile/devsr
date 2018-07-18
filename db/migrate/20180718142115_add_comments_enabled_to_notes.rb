class AddCommentsEnabledToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :comments_enabled, :boolean
  end
end
