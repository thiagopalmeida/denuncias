class ChangeUserIdRowInComplaints < ActiveRecord::Migration[6.0]
  def change
    change_column_null :complaints, :user_id, true
  end
end
