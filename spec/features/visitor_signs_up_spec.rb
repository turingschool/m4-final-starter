require "rails_helper"

describe "User registration" do
  it "visitor visits root path and is redirected to the log in or sign up page" do

    visit root_path
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login")
    expect(page).to have_content("Sign up by clicking here")
  end

  it "visitor clicks on sign up link and enters correct credentials into the form and successfully creates account" do

    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "bschwartz@gmail.com"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(1)
    expect(User.last.email).to eq("bschwartz@gmail.com")
    expect(current_path).to eq(root_path)
  end
  it "visitor clicks on sign up link and doesn't enter an email into the form and unsuccessfully creates account" do

    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(0)
    expect(page).to have_content("Email can't be blank")
    # expect(current_path).to eq(new_user_path)
  end
  it "visitor clicks on sign up link and doesn't enter password_confirmation into the form and unsuccessfully creates account" do

    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "bschwartz@gmail.com"
    fill_in "user[password]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(0)
    expect(page).to have_content("Password confirmation can't be blank")
  end
  it "visitor clicks on sign up link and doesn't enter a password into the form and unsuccessfully creates account" do

    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "bschwartz@gmail.com"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(0)
    expect(page).to have_content("Password can't be blank")
  end
  it "visitor clicks on sign up link an email that already exists into the form and unsuccessfully creates account" do
    create(:user)

    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "bschwartz@gmail.com"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(1)
    expect(page).to have_content("Email has already been taken")
  end
  it "visitor clicks on sign up link an email that already exists into the form and unsuccessfully creates account" do
    visit login_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "bschwartz@gmail.com"
    fill_in "user[password]", with: "1234"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"

    expect(User.all.count).to eq(0)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
