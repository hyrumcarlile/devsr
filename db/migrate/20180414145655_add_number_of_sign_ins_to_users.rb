class AddNumberOfSignInsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_of_sign_ins, :integer, default: 0
  end
end
