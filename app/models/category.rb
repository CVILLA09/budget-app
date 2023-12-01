class Category < ApplicationRecord
  # Associations
  has_and_belongs_to_many :users
  has_and_belongs_to_many :purchases
  has_one_attached :icon

  # Validations
  validates :name, presence: true
  validates :icon, presence: true
end
