require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :url }

  it { is_expected.to belong_to :user }

  it { is_expected.to allow_value("www.coollinkbro.com").for(:url) }
  it { is_expected.to_not allow_value("www.coollinkbro").for(:url) }

  it "has all required attributes" do
    user = create(:user)
    link = Link.create( title: "New Link",
                        url: "www.coollinkbro.com",
                        user_id: user )

    expect(link.title).to eq("New Link")
    expect(link.url).to eq("www.coollinkbro.com")
    expect(link.user_id).to eq(user.id)
    expect(link.read).to eq(false)
  end
end
