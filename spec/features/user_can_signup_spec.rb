require 'rails_helper'

RSpec.describe User do
  context 'sign up' do
    it 'can creat an account' do
      root_path
      click_on 'Sign up'

      fill_in 'user[email]', with: 'bcgoss@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      expect { click_on 'Submit' }.to change { User.count }.by 1
    end

    it 'shows useful errors' do
      visit signup_path

      fill_in 'user[email]', with: 'bcgoss@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'wrong'

      expect { click_on 'Submit' }.to change { User.count }.by 0
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

  end

  context 'login' do
    it 'accepts valid input' do
      me = create :user, email: 'bcgoss@example.com', password: 'password', password_confirmation: 'password'

      visit login_path

      fill_in 'email', with: me.email
      fill_in 'password', with: me.password

      click_on 'Submit'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Welcome bcgoss@example.com'
    end

    it 'shows userful errors' do
      me = create :user, email: 'bcgoss@example.com', password: 'password', password_confirmation: 'password'
      visit login_path

      fill_in 'email', with: me.email
      fill_in 'password', with: 'wrong'

      click_on 'Submit'

      expect(current_path).to eq login_path
      expect(page).to have_content 'Invalid email or password'

    end
  end

  context 'logout' do
    it 'is invisible to guests' do
      visit root_path

      expect(page).not_to have_content 'Logout'
    end

    it 'allows users to logout' do
      me = create :user

      login me

      click_on 'Logout'

      expect(current_path).to eq login_path
    end
  end
end
