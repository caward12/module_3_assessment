require 'rails_helper'

describe "user can search stores" do
  it "from homepage search bar" do
    VCR.use_cassette("user_search") do
      visit "/"

      fill_in "q", with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_css(".stores", :count => 10)
      
      within(".stores:nth-child(1)") do
        expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(page).to have_content("City: DENVER")
        expect(page).to have_content("Distance: 3.45 miles")
        expect(page).to have_content("Phone: 303-270-9189")
        expect(page).to have_content("Store Type: Mobile SAS")
      end
      within(".stores:nth-child(10)") do
        expect(page).to have_content("BEST BUY - SOUTHGLENN")
        expect(page).to have_content("City: CENTENNIAL")
        expect(page).to have_content("Distance: 11.02 miles")
        expect(page).to have_content("Phone: 303-797-3246")
        expect(page).to have_content("Store Type: Big Box")
      end

    end
  end
end