class AddFieldToComplaint < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :with_attach, :boolean
  end
end
