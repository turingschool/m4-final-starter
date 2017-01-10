require 'rails_helper'

RSpec.describe ReadsService, type: :model do
  it "create sends request to Hot Reads" do
    link = create :link
    ReadsService.create(link: link)

  end
end
