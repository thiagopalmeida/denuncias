class AddFieldToComplement < ActiveRecord::Migration[6.0]
  def change
    add_column :complements, :with_attach, :boolean
  end
end