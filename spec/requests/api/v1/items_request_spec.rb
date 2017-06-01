require 'rails_helper'

describe "items" do
  it "can show all items" do
    item = Item.create(name: "shoes", description: "two of them", image_url: "img.url")
    item2 = Item.create(name: "shirt", description: "just one", image_url: "img.url")
    get '/api/v1/items'

    expect(response).to be_success
    expect(response).to have_http_status(200)
    items = JSON.parse(response.body)

    expect(items).to be_an(Array)
    expect(items.first).to be_a(Hash)
    expect(items.first["id"]).to eq(item.id)
    expect(items.first["name"]).to eq(item.name)
    expect(items.first["description"]).to eq(item.description)
    expect(items.first["image_url"]).to eq(item.image_url)
    expect(items.count).to eq(2)
  end

  it "can show a single item" do
    item = Item.create(name: "shoes", description: "two of them", image_url: "img.url")

    get "/api/v1"
  end
end