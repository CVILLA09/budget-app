class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_and_belongs_to_many :categories
  has_many :purchases, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :profile_picture

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: true
end
