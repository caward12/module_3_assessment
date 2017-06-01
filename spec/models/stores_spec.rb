require 'rails_helper'

describe 'stores' do
  it "can create new store from raw data" do
    store = Store.new(stub_store)

    expect(store).to be_a(Store)
    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.city).to eq("DENVER")
    expect(store.name).to eq(3.45)
    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")

  end
end