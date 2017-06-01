require 'rails_helper'

describe 'stores' do
  it "can create new store from raw data" do
    store = Store.new(stub_store)

    expect(store).to be_a(Store)
    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.city).to eq("DENVER")
    expect(store.distance).to eq(3.45)
    expect(store.phone).to eq("303-270-9189")
    expect(store.store_type).to eq("Mobile SAS")
  end

  it "can find list of nearby stores" do
    VCR.use_cassette("nearby_stores") do
      zip = "80202"
      stores = Store.nearby_stores(zip)

      expect(stores).to be_an(Array)
      expect(stores.first).to be_a(Store)
      expect(stores.count).to eq(10)
    end
  end
end