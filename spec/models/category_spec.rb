require 'rails_helper'

RSpec.describe Category, type: :model do
  # Assuming you have a factory for categories defined
  let(:category) { create(:category) }

  # Test for association with users
  it 'can be associated with users' do
    user1 = create(:user)
    user2 = create(:user)
    category.users << [user1, user2]
  
    expect(category.users).to include(user1, user2)
  end

  # Test for model validity
  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  # Test for presence of name
  it 'is not valid without a name' do
    category.name = ''
    expect(category).not_to be_valid
  end

  # Test for presence of icon
  it 'is not valid without an icon' do
    category.icon = nil
    expect(category).not_to be_valid
  end

  # Test associations
  describe 'associations' do
    it { should have_and_belong_to_many(:users) }
    it { should have_many(:purchases) }
    it { should have_one_attached(:icon) }
  end
end
