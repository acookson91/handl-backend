require 'rails_helper'

describe DeliveriesController, 'testing deliveries' do
  before(:all) do
    James = Delivery.create(recipient: 'James', pickup_address: '123 567', dropoff_address: '3422 234', status: 'pending')
    Sachin = Delivery.create(recipient: 'Sachin', pickup_address: 'Mayfair', dropoff_address: '230 432', status: 'pending')
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

  it 'allows user to change status to assigned', type: :request do
    params = {status: 'assigned'}
    patch "/deliveries/#{Sachin.id}.json", delivery: params
    expect(Delivery.last.status).to eq('assigned')
  end

  it 'allows user to change status to collected', type: :request do
    params = {status: 'collected'}
    patch "/deliveries/#{Sachin.id}.json", delivery: params
    expect(Delivery.last.status).to eq('collected')
  end

  it 'allows user to change status to delivered', type: :request do
    params = {status: 'delivered'}
    patch "/deliveries/#{Sachin.id}.json", delivery: params
    expect(Delivery.last.status).to eq('delivered')
  end
end
