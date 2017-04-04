FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "waylon_#{n}@country.com"}
    password 'password'
    password_confirmation 'password'
  end
end
