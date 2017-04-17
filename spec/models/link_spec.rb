require "rails_helper"

describe Link do
  it ("can find the most read url") do
    create_list(:link, 3, url:"https://www.david.com", read: true)    
    create_list(:link, 2, url:"https://www.google.com", read: true)
    create(:link, url: "https://www.puppy.com", read: false)
    expect(Link.get_top_link).to eq "https://www.david.com"
  end

  it ("can find the top 10 read urls") do
    create_list(:link, 10, read: true)   
    create(:link, url:"https://www.google1.com/", read: true)   
    create(:link, url: "https://www.puppy.com", read: false)

    expect(Link.get_top_10.length).to eq 10
    expect(Link.get_top_10.first.first).to eq "https://www.google1.com/"
  end
end