require 'rails_helper'

describe DeliveriesController, 'testing deliveries' do
  let(:delivery) { create :delivery, sender_name: 'Phil' }

  it 'displays existing delivery requests', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json[0]['sender_name']).to eq('James')
  end

  it 'displays postcode', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json[0]['pickup_postcode']).to eq('W1 6XY')
  end

  it 'allows user to create delivery request', type: :request do
    params = build_params
    post '/deliveries.json', delivery: params
    expect(Delivery.last.recipient_name).to eq('Andrew')
  end

  it 'allows user to change status to assigned', type: :request do
    params = {status: 'assigned'}
    patch "/deliveries/#{delivery.id}.json", delivery: params
    expect(Delivery.last.status).to eq('assigned')
  end

  it 'allows user to change status to collected', type: :request do
    params = {status: 'collected'}
    patch "/deliveries/#{delivery.id}.json", delivery: params
    expect(Delivery.last.status).to eq('collected')
  end

  it 'allows user to change status to delivered', type: :request do
    params = {status: 'delivered'}
    patch "/deliveries/#{delivery.id}.json", delivery: params
    expect(Delivery.last.status).to eq('delivered')
  end
end
