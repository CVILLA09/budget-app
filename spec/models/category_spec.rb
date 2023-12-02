require 'rails_helper'

RSpec.describe Category, type: :model do
  # Assuming you have a factory for categories defined
  let(:category) { create(:category) }

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
