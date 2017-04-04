FactoryGirl.define do
  factory :user do
    email_address Faker::Internet.email
  end
end
