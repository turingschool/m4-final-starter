FactoryGirl.define do
  factory :link do
    title 'google'
    url 'https://www.google.com/'
    read false
    user
  end
end
