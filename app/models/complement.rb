class Complement < ApplicationRecord
  belongs_to :complaint
  # belongs_to :user, through :complaint
  has_many_attached :attachments, dependent: :destroy
  # validates :additional_information, presence: true, length: { minimum: 10 }
end
