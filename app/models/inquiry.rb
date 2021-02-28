class Inquiry < ApplicationRecord
  validates :address, presence: true
  validates :name, presence: true
  validates :message, presence: true
end
