class AddSlugToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :slug, :string, index: true
  end
end
