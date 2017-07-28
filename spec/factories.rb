FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email("sample#{n}") }
    password "some_password"
    password_confirmation "some_password"
  end
  factory :link do
    url "http://YouTube.com"
    title "YouTube"
  end
end
