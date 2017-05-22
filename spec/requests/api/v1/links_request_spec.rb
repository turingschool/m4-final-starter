require 'rails_helper'

describe "links API" do
  it "can create a new link" do
    params = { title: "title", url: "http://www.google.com" }

    post "/api/v1/links",  params
    link = Link.last

    assert_response :success
    expect(response).to be_success
    expect(link.title).to eq(params[:title])
    expect(link.url).to eq(params[:url])
  end
end
