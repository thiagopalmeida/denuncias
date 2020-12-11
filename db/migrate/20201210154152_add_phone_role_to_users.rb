class AddPhoneRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :integer
    add_column :users, :role, :integer
  end
end
