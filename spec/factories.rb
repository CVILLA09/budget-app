FactoryBot.define do
  factory :user, aliases: [:author] do
    sequence(:name) { |n| "User #{n}" }
    email { Faker::Internet.email }
    password { 'password123' }
  end

  factory :category do
    sequence(:name) { |n| "Sample Category #{n}" }
    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample_icon.png'), 'image/png') }
  end

  factory :purchase do
    sequence(:name) { |n| "Purchase #{n}" }
    amount { Faker::Number.decimal(l_digits: 2) }
    author

    trait :with_category do
      after(:create) do |purchase|
        purchase.categories << create(:category) # Assuming :category is your category factory
      end
    end
  end
  factory :purchase_with_category, traits: [:with_category]
end
