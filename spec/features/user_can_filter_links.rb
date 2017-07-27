require "rails_helper"

RSpec.describe "User can filter links", :js => :true do

  scenario "User shows only read links" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")
    user.links.create(url:"https://pizza.io", title:"Pizza", read: true)
    visit "/"

    expect(page).to have_text("URL: https://turing.io")
    expect(page).to have_text("Title: Turing")
    expect(page).to have_text("URL: https://pizza.io")
    expect(page).to have_text("Title: Pizza")

    click_on "Only Read Links"

    expect(page).to_not have_text("URL: https://turing.io")
    expect(page).to_not have_text("Title: Turing")

    within('.read-true') do
      expect(page).to have_text("URL: https://pizza.io")
      expect(page).to have_text("Title: Pizza")
    end
  end

  scenario "User shows only unread links" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")
    user.links.create(url:"https://pizza.io", title:"Pizza", read: true)
    visit "/"

    expect(page).to have_text("URL: https://turing.io")
    expect(page).to have_text("Title: Turing")
    expect(page).to have_text("URL: https://pizza.io")
    expect(page).to have_text("Title: Pizza")
  
    click_on "Only Unread Links"

    expect(page).to_not have_text("URL: https://pizza.io")
    expect(page).to_not have_text("Title: Pizza")

    within('.read-false') do
      expect(page).to have_text("URL: https://turing.io")
      expect(page).to have_text("Title: Turing")
    end
  end

  scenario "User shows all links" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")
    user.links.create(url:"https://pizza.io", title:"Pizza", read: true)
    visit "/"

    click_on "Only Read Links"
    click_on "Only Unread Links"

    expect(page).to_not have_text("URL: https://pizza.io")
    expect(page).to_not have_text("Title: Pizza")

    click_on "Show All Links"

    within('.read-true') do
      expect(page).to have_text("URL: https://pizza.io")
      expect(page).to have_text("Title: Pizza")
    end

    within('.read-false') do
      expect(page).to have_text("URL: https://turing.io")
      expect(page).to have_text("Title: Turing")
    end
  end

  scenario "User can filter with search bar" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")
    user.links.create(url:"https://Pizza.io", title:"Pizza")
    visit "/"

    fill_in "search-filter", with: "Turing"

    expect(page).to_not have_text("URL: https://Pizza.io")
    expect(page).to_not have_text("Title: Pizza")

    within('.link') do
      expect(page).to have_text("URL: https://turing.io")
      expect(page).to have_text("Title: Turing")
    end

    fill_in "search-filter", with: "pizza"

    expect(page).to_not have_text("URL: https://turing.io")
    expect(page).to_not have_text("Title: Turing")

    within('.link') do
      expect(page).to have_text("URL: https://Pizza.io")
      expect(page).to have_text("Title: Pizza")
    end


  end
end
