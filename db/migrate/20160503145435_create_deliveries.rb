class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :sender_name
      t.string :pickup_line1
      t.string :pickup_line2
      t.string :pickup_postcode
      t.string :recipient_name
      t.string :dropoff_line1
      t.string :dropoff_line2
      t.string :dropoff_postcode
      t.string :status
      t.integer :handlr_id
      
      t.timestamps null: false
    end


  end
end
