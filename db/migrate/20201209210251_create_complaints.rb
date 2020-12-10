class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.boolean :custom
      t.string :ni_comp
      t.integer :year_comp
      t.string :keep
      t.text :description
      t.string :status
      t.integer :admin_user
      t.integer :rating
      t.string :ua
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key "complaints", "users", column: "admin_user"
  end
end
