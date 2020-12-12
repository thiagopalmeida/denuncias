class Category < ApplicationRecord
  has_many :complaint_categories
  has_many :complaints, through: :complaint_categories

  validates :title, presence: true
end
