require 'rails_helper'

describe 'bestbuy service' do
  it "can find raw store data with zip" do
    VCR.use_cassette("bestbuy_service") do

      zip = "80202"

      stores = BestbuyService.new(zip).nearby_stores
      expect(stores[:stores].first).to be_a(Hash)
      expect(stores[:stores].count).to eq(16)
      expect(stores[:stores].first).to have_key(:longName)
      expect(stores[:stores].first).to have_key(:city)
      expect(stores[:stores].first).to have_key(:distance)
      expect(stores[:stores].first).to have_key(:phone)
      expect(stores[:stores].first).to have_key(:storeType)
    end
  end
end