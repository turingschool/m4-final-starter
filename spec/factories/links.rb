FactoryGirl.define do
  factory :link do
    title 'Link Title'
    url 'https://www.example.com'
    read false
    user
  end
end
