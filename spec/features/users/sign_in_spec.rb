require 'rails_helper'

describe 'user sign in' do
  context 'as a user' do
    let!(:user) { create(:user, password: 'test') }

    before do
      visit login_path
    end

    describe 'when I sign in with proper credentials' do
      before do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_on 'Submit'
      end

      it 'I should see success flash message' do
        expect(page).to have_content 'successfully logged in!'
      end
    end

    describe 'when I try to sign in with invalid credentials'
  end
end
