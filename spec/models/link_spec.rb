require "rails_helper"

RSpec.describe "Link" do
  it "is invalid without url" do
    link = Link.create(title: "Sure is a link")
    expect(link).to be_invalid
  end

  it "is invalid without a valid url" do
    link = Link.create(title: "Sure is a link", url: "turing.io")
    expect(link).to be_invalid
  end

  it "is valid with title and url" do
    link = Link.create(title: "j@j.com", url: "https://turing.io")
    expect(link).to be_valid
  end

  it "is unread by default" do
    link = Link.create(title: "j@j.com", url: "https://turing.io")
    expect(link.read).to be false
  end

end
