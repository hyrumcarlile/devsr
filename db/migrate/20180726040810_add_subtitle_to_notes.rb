class AddSubtitleToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :subtitle, :text
  end
end
