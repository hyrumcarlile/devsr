class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :double, default: 0
  end
end
