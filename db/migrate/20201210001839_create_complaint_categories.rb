class CreateComplaintCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :complaint_categories do |t|
      t.references :complaint, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
