class Purchase < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :category

  # Validations
  validates :name, presence: true
  validates :amount, presence: true
  validates :category, presence: true
end
