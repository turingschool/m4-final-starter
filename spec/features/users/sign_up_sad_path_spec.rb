require 'rails_helper'
feature 'Sign up sad paths' do
  before { visit signup_path }

  context 'the user fails to create an account' do
    scenario 'user fails to enter the password correctly' do
     fill_in 'user[email]' , with: 'Rick James'
     fill_in 'user[password]', with: ''
     fill_in 'user[password_confirmation]', with: ''

     click_on 'Sign me up!'

     expect(page).to have_content("Password confirmation can't be blank")
     expect(page).to have_content("Password can't be blank")
    end

    scenario 'user fails to enter the password_confirmation correctly' do
     fill_in 'user[email]' , with: 'Rick James'
     fill_in 'user[password]', with: 'What!'
     fill_in 'user[password_confirmation]', with: 'What'

     click_on 'Sign me up!'

     expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario 'user fails to enter a email' do
     fill_in 'user[email]' , with: ''
     fill_in 'user[password]', with: 'What!'
     fill_in 'user[password_confirmation]', with: 'What!'

     click_on 'Sign me up!'

     expect(page).to have_content("Email can't be blank")
    end
  end
end
