require 'rails_helper'

describe "Links API" do
  it "can create a link" do 
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post "/api/v1/links", params: {link: {title: "Google", url: "https://www.google.com/"}}

    expect(response.status).to eq 201
    expect(Link.count).to eq 1
  end
end