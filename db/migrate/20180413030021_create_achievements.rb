class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.text :name
      t.text :description
      t.text :icon_name

      t.timestamps
    end
  end
end
