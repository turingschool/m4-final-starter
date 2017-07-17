FactoryGirl.define do
  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end

  sequence :email do |n|
    "test#{n}@test.com"
  end
end
