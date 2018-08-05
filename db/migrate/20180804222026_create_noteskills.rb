class CreateNoteskills < ActiveRecord::Migration[5.0]
  def change
    create_table :noteskills do |t|
      t.references :note, foreign_key: true
      t.references :skill, foreign_key: true
    end
  end
end
