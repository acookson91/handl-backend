require 'rails_helper'

describe DeliveriesController, 'testing deliveries' do
  before(:each) do
    Delivery.create(recipient: 'James', pickup_address: '123 567', dropoff_address: '3422 234', status: 'pending')
    Delivery.create(recipient: 'Sachin', pickup_address: 'Mayfair', dropoff_address: '230 432', status: 'pending')
  end

  it 'displays existing delivery requests', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json[0]['recipient']).to eq('James')
    expect(json[1]['recipient']).to eq('Sachin')
  end

  it 'allows user to create delivery request', type: :request do
    params = {recipient: 'Simon', pickup_address: 'Old St', dropoff_address: '230 000', status: 'pending'}
    post '/deliveries.json', delivery: params
    expect(Delivery.last.recipient).to eq('Simon')
  end
end
