require 'rails_helper'

describe "user can search stores" do
  it "from homepage search bar" do
    VCR.use_cassette("user_search") do
      visit "/"

      fill_in "q", with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_selector('stores', count: 10)
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("BEST BUY - SOUTHGLENN")
    end
  end
end