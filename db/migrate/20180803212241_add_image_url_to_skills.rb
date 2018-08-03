class AddImageUrlToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :image_url, :text
  end
end
