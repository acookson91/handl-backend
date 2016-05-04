FactoryGirl.define do
  factory :delivery do
    sender_name 'James'
    pickup_line1 '1 Mayfair Road'
    pickup_line2 'London'
    pickup_postcode 'W1 6XY'
    recipient_name 'Simon'
    dropoff_line1 '2 Hoxton Street'
    dropoff_line2 'London'
    dropoff_postcode 'E1C 8KJ'
    status 'pending'
  end
end
