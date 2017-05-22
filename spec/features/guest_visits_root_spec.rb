require "rails_helper"


feature 'guest visits root' do
  scenario 'guest is redirected to login/signup page' do
    visit '/'

    expect(current_path).to eq('/guests')
  end
end
