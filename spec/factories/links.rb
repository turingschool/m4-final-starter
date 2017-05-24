FactoryGirl.define do
  factory :link do
    sequence(:title) { |n| "Title-#{n}"}
    sequence(:url) { |n| "https://www.fake-link-#{n}.com"}
    user
  end
end
