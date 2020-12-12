class Category < ApplicationRecord
  has_many :complaint_categories

  # validates :title, presence: true
end
