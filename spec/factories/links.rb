FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
    title { Faker::Pokemon.name }
    read false
    user 
  end
end
