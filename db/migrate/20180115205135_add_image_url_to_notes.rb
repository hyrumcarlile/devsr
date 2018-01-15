class AddImageUrlToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :image_url, :text
  end
end
