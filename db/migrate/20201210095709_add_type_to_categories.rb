class AddTypeToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :sector, :string
  end
end
