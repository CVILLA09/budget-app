class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :purchases, foreign_key: 'author_id', dependent: :destroy
  has_many :categories, through: :purchases
  has_one_attached :profile_picture

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: true
end
