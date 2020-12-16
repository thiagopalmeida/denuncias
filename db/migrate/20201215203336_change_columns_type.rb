class ChangeColumnsType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone, :string
  end
end
