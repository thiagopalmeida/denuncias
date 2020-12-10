class ComplaintCategory < ApplicationRecord
  belongs_to :complaint
  belongs_to :category
end
