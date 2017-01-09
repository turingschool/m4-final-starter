module LoginHelper

  def login(user)
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_on 'Submit'
  end
end
