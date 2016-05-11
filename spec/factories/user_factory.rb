FactoryGirl.define do
  factory :user do
    email 'bob@bob.com'
    password '12345678'
    password_confirmation '12345678'


    factory :user_with_delivery do
      after(:create) do |user|
        create(:delivery, user: user)
      end
    end
  end
end
