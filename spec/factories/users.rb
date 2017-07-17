FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "MyString"
    password_confirmation "MyString"
  end
end
