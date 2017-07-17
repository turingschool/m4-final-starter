require "rails_helper"

RSpec.describe "User can log in and out", :js => :true do
  scenario "Registered user visits site, can log in and log out" do
    user = create(:user)
    visit "/"
    expect(page).to have_current_path('/login')

    fill_in('email', with: 'test@test.com')
    fill_in('password', with: user.password)
    click_on('Submit')

    expect(page).to have_content('LogIn succesful')
    click_on('Logout')

    expect(page).to have_current_path('/login')
  end

  scenario "Wrong email sad path" do
    user = create(:user)
    visit "/"
    expect(page).to have_current_path('/login')

    fill_in('email', with: 'wrong@test.com')
    fill_in('password', with: user.password)
    click_on('Submit')

    expect(page).to have_content('LogIn unsuccesful')
  end

  scenario "Wrong password sad path" do
    user = create(:user)
    visit "/"
    expect(page).to have_current_path('/login')

    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'wrong')
    click_on('Submit')

    expect(page).to have_content('LogIn unsuccesful')
  end

end
