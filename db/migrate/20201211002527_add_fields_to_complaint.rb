class AddFieldsToComplaint < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :know_ni, :boolean
    add_column :complaints, :name, :string
    add_column :complaints, :address, :string
  end
end
