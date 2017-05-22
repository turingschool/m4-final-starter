FactoryGirl.define do
  factory :link do
    sequence :title do |n|
      "link-#{n}"
    end
    url Faker::Internet.url
    user_id 1
  end
end
