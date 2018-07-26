class ChangeCommentsEnabledToCommentsDisabledOnNotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :notes, :comments_enabled, :comments_disabled
  end
end
