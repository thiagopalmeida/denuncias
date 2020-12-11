class ChangeComplaintsCustom < ActiveRecord::Migration[6.0]
  def change
    remove_column :complaints, :custom, :boolean
    add_column :complaints, :custom, :integer
  end
end
