class User < ApplicationRecord
    # Associations
    has_many :purchases, foreign_key: 'author_id', dependent: :destroy
    has_many :categories, through: :purchases

    # Attributes
    attribute :name, :string
    
    # Validations
    validates :name, presence: true
  
    # Add methods for devise if you're using it for authentication
  end
  