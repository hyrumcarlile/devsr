class CreateSkillRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_ratings do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true
      t.decimal :rating, precision: 15, scale: 5, default: 0

      t.timestamps
    end
  end
end
