require 'rails_helper'

describe DeliveriesController, 'testing deliveries' do
  before(:each) do
    Delivery.create(recipient: 'James', pickup_address: '123 567', dropoff_address: '3422 234', status: 'pending')
    Delivery.create(recipient: 'Sachin', pickup_address: 'Mayfair', dropoff_address: '230 432', status: 'pending')
  end

  it 'can create a delivery', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json[0]['recipient']).to eq('James')
    expect(json[1]['recipient']).to eq('Sachin')
  end
end
