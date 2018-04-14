class CreateAchievementCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :achievement_criteria do |t|
      t.references :user, foreign_key: true
      t.integer :consecutive_logins
      t.timestamp :last_login
      t.boolean :has_founder
      t.boolean :has_lightbulb
      t.boolean :has_pest_control
      t.boolean :has_lifesaver
      t.boolean :has_party_parrot
      t.boolean :has_party_corgi
      t.boolean :has_party_wizard

      t.timestamps
    end
  end
end
