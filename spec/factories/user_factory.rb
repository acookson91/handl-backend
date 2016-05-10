FactoryGirl.define do
  factory :user do
    email 'bob@bob.com'
    password 'password123'
    password_confirmation 'password123'

    factory :user_with_delivery do
      after(:create) do |user|
        create(:delivery, user: user)
      end
    end
  end
end
