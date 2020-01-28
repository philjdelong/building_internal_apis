require 'rails_helper'

describe "Items API" do
it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end

  it 'can get one item with customized json' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(item.keys).to include('id')
    expect(item.keys).to include('name')
    expect(item.keys).to include('description')
    expect(item.keys).to_not include('created_at')
    expect(item.keys).to_not include('updated_at')
  end

  it 'can get one item with a custom attribute' do
    item = create(:item)
    create_list(:order_item, 3, item: item)

    get "/api/v1/items/#{item.id}"

    item = JSON.parse(response.body)
    expect(item['num_times_ordered']).to eq(3)
  end

  it "can create an item" do
    item_params = {name: "Saw", description: "I want to play a game"}

    post "/api/v1/items", params: {item: item_params}

    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it "can update" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = { name: "Snakebite"}

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Snakebite")
  end

  it "can destroy an item" do
    item = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
