# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Delivery.create([{
    sender_name: 'James',
    pickup_line1: '1 Mayfair Road',
    pickup_line2: 'London',
    pickup_postcode: 'W1 6XY',
    recipient_name: 'Andrew',
    dropoff_line1: '2 Hoxton Street',
    dropoff_line2: 'London',
    dropoff_postcode: 'E1C 8KJ'
  },
  {
      sender_name: 'Phil',
      pickup_line1: '1 Shoreditch Road',
      pickup_line2: 'London',
      pickup_postcode: 'E17 7JY',
      recipient_name: 'Carrie',
      dropoff_line1: '2 Kingsland Street',
      dropoff_line2: 'London',
      dropoff_postcode: 'E9 1CJ',
      status: 'pending'
    }])
