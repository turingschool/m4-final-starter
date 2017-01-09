require 'rails_helper'

RSpec.describe User do
  it 'can creat an account' do
    visit signup_path

    fill_in 'user[email]', with: 'bcgoss@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    expect { click_on 'Submit' }.to change { User.count }.by 1

  end

  it 'can log in' do
    me = create :user, email: 'bcgoss@example.com', password: 'password'

    visit login_path

    fill_in 'email', with: me.email
    fill_in 'password', with: me.password

    click_on 'Submit'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome bcgoss@example.com'

  end
end
