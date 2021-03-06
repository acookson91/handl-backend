require 'rails_helper'

describe User do
  it { is_expected.to have_many :deliveries}
end

describe UsersController, 'testing users' do
  doubles

  before(:each) do
    @simon = create :user_with_delivery
    @delivery = @simon.deliveries[0]
    @auth_headers = @simon.create_new_auth_token
    @sachin = create :user, email: "sachin@sachin.com"
    @delivery.update(handlr_id: @simon.id)

    @delivery2 = create(:delivery, user: @simon)
    @delivery2.update(handlr_id: @sachin.id)
  end

  it 'displays users deliveries if logged in', type: :request do
    get "/users/#{@simon.id}", {}, @auth_headers

    expect(json[0][0]['sender_name']).to eq(@delivery.sender_name)
  end

  it 'does not display users deliveries if logged out', type: :request do
    get "/users/#{@simon.id}", {}, {}
    expect(json).to eq(auth_error)
  end

  it 'shows handlrs deliveries', type: :request do
    @auth_headers = @sachin.create_new_auth_token
    get "/users/#{@sachin.id}", {}, @auth_headers

    expect(json[1][0]['handlr_id']).to eq(@sachin.id)
  end

end
