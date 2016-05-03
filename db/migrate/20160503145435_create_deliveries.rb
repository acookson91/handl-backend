class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :recipient
      t.string :pickup_address
      t.string :dropoff_address
      t.string :status

      t.timestamps null: false
    end
  end
end
