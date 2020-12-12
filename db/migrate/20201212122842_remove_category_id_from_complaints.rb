class RemoveCategoryIdFromComplaints < ActiveRecord::Migration[6.0]
  def change
    remove_column :complaints, :complaint_categories_id
  end
end
