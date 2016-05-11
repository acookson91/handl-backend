require 'rails_helper'

describe Delivery do
  it { is_expected.to belong_to :user}
end

describe DeliveriesController, 'testing deliveries' do
  doubles

  before(:each) do
    @simon = create :user_with_delivery
    @delivery = @simon.deliveries[0]
    @auth_headers = @simon.create_new_auth_token
    @delivery2 = create :delivery, sender_name: 'Maria'
  end

  it 'displays existing delivery requests', type: :request do
    get '/', {}, @auth_headers
    expect(json[0]['sender_name']).to eq(@delivery.sender_name)
  end

  it 'shows a specific delivery request', type: :request do
    get "/deliveries/#{@delivery.id}", {}, @auth_headers
    expect(json.length).to be(ENTRIES_IN_INDIVIDUAL_HASH)
  end

  it 'displays postcode', type: :request do
    get '/' , {}, @auth_headers
    expect(json[0]['pickup_postcode']).to eq(@delivery.pickup_postcode)
  end

  it 'allows user to create delivery request', type: :request do
    post '/deliveries.json', new_delivery_params, @auth_headers
    expect(Delivery.last.recipient_name).to eq(new_delivery_params[:recipient_name])
  end

  it 'allows user to change status to assigned', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_assigned, @auth_headers
    expect(status).to eq('assigned')
  end

  it 'allows user to change status to collected', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_collected, @auth_headers
    expect(status).to eq('collected')
  end

  it 'allows user to change status to delivered', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_delivered, @auth_headers
    expect(status).to eq('delivered')
  end

  it 'displays existing delivery requests', type: :request do
    get '/', {}, {}
    p auth_error
    expect(json).to eq(auth_error)
  end
end
