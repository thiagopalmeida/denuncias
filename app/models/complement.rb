class Complement < ApplicationRecord
  belongs_to :complaint

  # validates :additional_information, presence: true, length: { minimum: 10 }
end
