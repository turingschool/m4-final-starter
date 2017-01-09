FactoryGirl.define do
  factory :read do
    link nil
  end
end


FactoryGirl.define do
  factory :user do
    email "MyString"
    password_digest "MyString"
  end
end
