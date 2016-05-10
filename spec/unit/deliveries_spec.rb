require 'rails_helper'

describe Delivery, type: :model do
  it { is_expected.to belong_to :user }
end

describe DeliveriesController, 'testing deliveries' do
  doubles

  before(:each) do
    @user = create :user_with_delivery
    @delivery = @user.deliveries[0]
  end

  it 'displays existing delivery requests', type: :request do
    get '/'
    expect(json[0]['sender_name']).to eq(@delivery.sender_name)
  end

  it 'shows a specific delivery request', type: :request do
    get "/deliveries/#{@delivery.id}"
    expect(json.length).to be(ENTRIES_IN_INDIVIDUAL_HASH)
  end

  it 'displays postcode', type: :request do
    get '/'
    expect(json[0]['pickup_postcode']).to eq(@delivery.pickup_postcode)
  end

  it 'allows user to create delivery request', type: :request do
    post '/deliveries.json', new_delivery_params
    expect(Delivery.last.recipient_name).to eq(new_delivery_params[:recipient_name])
  end

  it 'allows user to change status to assigned', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_assigned
    expect(status).to eq('assigned')
  end

  it 'allows user to change status to collected', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_collected
    expect(status).to eq('collected')
  end

  it 'allows user to change status to delivered', type: :request do
    patch "/deliveries/#{@delivery.id}.json", status_delivered
    expect(status).to eq('delivered')
  end
end
