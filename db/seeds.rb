# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Delivery.create([{
    sender_name: 'James',
    pickup_line1: '11 st peters way',
    pickup_line2: 'hertfordshire',
    pickup_postcode: 'WD3 5QF',
    recipient_name: 'Andrew',
    dropoff_line1: '100 gosset street',
    dropoff_line2: 'London',
    dropoff_postcode: 'E2 6NT'
  },
  {
    sender_name: 'Phil',
    pickup_line1: '1 Browning Street',
    pickup_line2: 'London',
    pickup_postcode: 'SE17 1LN',
    recipient_name: 'Carrie',
    dropoff_line1: '50 Commercial St',
    dropoff_line2: 'London',
    dropoff_postcode: 'E1 6LT',
    status: 'pending'
}])

User.create(
    email: 'bob@bob.com',
    password: 'password123',
    password_confirmation: 'password123'
)
