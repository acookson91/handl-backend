# handl-backend

Handl is here to take the hastle out of sending parcels in the London area. Customers are able to input the pick-up and drop-off addresses and view the delivery route prior to confirmation.

Once confirmed the new delivery shows in the riders home screen. Riders can select which parcel they would like to pick up. They can see the details of all dliveries and identify which is closest and how to get to all of the pickup points. Once collected the app will direct the rider to the parcels final destination.

This is the repo for the backend part of the angular on rails app. The API serves as storage of all user information and includes the details of all deliveries which can be accessed by the front-end and displayed using the google maps api.

Below are some of our design steps and future innovation.

## Understand

Problem: Difficult to instantly deliver a parcel (central london)

Objective: To create an instant, paperless delivery service.

## MVP

#### CUSTOMER:

create a delivery
name
pick-up address
drop-off address

##### Possible customers

Offices – legal trade – quick documentation sent out in physical form

Deliver packed lunch if it's forgotten

Post office delivery?

#### COURIER:

list all possible delivery requests
select a delivery
confirm selection

## Future improvements:

implement Paypal, much like the uber model, for quick payment – invoice generation, log, rating, speed, efficiency, community.

have QR code confirmation emails that the courier needs to scan

bidding system by proximity by time

courier rating 

customer rating track package
