class CreateJoinTableAchievementsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :achievements, :users do |t|
      t.index [:user_id, :achievement_id], unique: true
      t.index [:achievement_id, :user_id], unique: true
    end
  end
end
