FactoryGirl.define do
  factory :read do
    link nil
  end
end


FactoryGirl.define do
  factory :user do
    email "rsbarbo@example.com"
    password_digest "password"
  end
end
