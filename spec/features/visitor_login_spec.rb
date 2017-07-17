require "rails_helper"

describe "Visitor log in" do
  it "visitor visits login path and enters correct credentials to sign in" do
    user = create(:user)

    visit login_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Log Out')
    expect(page).to have_content('Log in successful')
  end
  it "visitor visits login path and enters incorrect credentials to sign in and recieves a flash message" do
    user = create(:user)

    visit login_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: '12345'
    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Unsuccessful Log In')
  end
end
