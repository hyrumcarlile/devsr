class AddRatingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rating, :decimal, precision: 15, scale: 5, default: 0
  end
end
