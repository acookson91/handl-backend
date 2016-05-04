def doubles
  let(:json) { JSON.parse(response.body) }
  let(:status) { Delivery.first.status }
  let(:new_delivery_params) { attributes_for(:delivery, recipient_name: "Andrew") }
  let(:status_assigned) { {status: 'assigned'} }
  let(:status_collected) { {status: 'collected'} }
  let(:status_delivered) { {status: 'delivered'} }
end

  ENTRIES_IN_INDIVIDUAL_HASH = 10
