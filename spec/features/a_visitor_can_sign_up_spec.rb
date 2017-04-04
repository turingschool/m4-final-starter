require 'rails_helper'

describe 'New user Sign Up' do
  describe 'Through sign up form' do
    xit 'will create account for new user and redirect to links index page' do
      # As an unauthenticated user, if I click "Sign Up", I should be taken to a form where I can enter an email address, a password, and a password confirmation.
      # I cannot sign up with an email address that has already been used.
      # I cannot sign up without an email address and a password.
      # Password and confirmation must match.
      # If criteria is not met the user should be given a message to reflect the reason they could not sign up.
      # Upon submitting this information, I should be logged in and redirected to the "Links Index" page.
    end
  end
end