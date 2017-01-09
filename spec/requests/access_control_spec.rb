require 'rails_helper'

RSpec.describe SessionsController do
  context 'Guest' do
    it 'cannot view index' do
      get root_path

      expect(response).to redirect_to login_path
    end

    it 'can view signup page' do
      get signup_path

      expect(response.status).to be 200
    end

    it 'cannot view index' do
      get links_path

      expect(response).to redirect_to login_path
    end

    it 'cannot edit links' do
      link = create :link
      get edit_link_path link.id
      expect(response).to redirect_to login_path
    end
  end

  context 'Logged in User' do
    before do
      @me = create :user, email: 'bcgoss@example.com'
      app_controller = double("ApplicationHelper")
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)

    end

    it 'can view index' do
      get links_path
      expect(response.status).to eq 200
    end

    it 'can view edit' do
      link = create :link
      get edit_link_path link.id
      expect(response.status).to eq 200
    end
  end
end
