class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, 'double precision', default: 0
  end
end
