FactoryGirl.define do
  factory :user do
    email_address Faker::Internet.email
    password 'password'
    password_confirmation 'password'
  end
end
