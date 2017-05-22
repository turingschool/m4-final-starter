require 'rails_helper'

feature 'guest visits root and clicks Sign Up link' do
  scenario 'guest is redirected to new users path' do
    visit '/'

    click_link 'Sign Up'

    expect(current_path).to eq('/users/new')
  end

  scenario 'guest sees a registration form' do
    visit '/'

    click_link 'Sign Up'

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_field("Password confirmation")
  end
  scenario 'when guest submits registration user is added and redirect to links index' do
    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button "Register"

    new_user = User.last
    expect(new_user.email).to eq('test@test.com')

    expect(current_path).to eq('/links')
  end
  scenario 'when guest submits registration user is added and redirect to links index' do
    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    expect {click_button "Register"}.to change {User.count}.by(1)

    new_user = User.last
    expect(new_user.email).to eq('test@test.com')

    expect(current_path).to eq('/links')
  end
  scenario 'guest cannot register with a previously registered email; error displayed' do
    User.create(email: 'test@test.com',
                password: 'password1',
                password_confirmation: 'password1')
    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    expect {click_button "Register"}.to change {User.count}.by(0)

    expect(current_path).to eq('/users/new')

    within('.alert') do
      expect(page).to have_content('That e-mail has already been registered')
    end
  end
  scenario 'guest will see alert if registration failed due to passwords not matching' do

    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password_oops'

    expect {click_button "Register"}.to change {User.count}.by(0)

    expect(current_path).to eq('/users/new')

    within('.alert') do
      expect(page).to have_content('Password and password confirmation must match')
    end
  end
  scenario 'guest cannot register if email is blank during registration attempt' do

    visit '/'

    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    expect {click_button "Register"}.to change {User.count}.by(0)

    expect(current_path).to eq('/users/new')

  end
  scenario 'guest cannot register if password confirmation field is blank' do

    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'

    expect {click_button "Register"}.to change {User.count}.by(0)

    expect(current_path).to eq('/users/new')

  end
end
