class Delivery < ActiveRecord::Base

  def as_json(options={})
    super(only: [:id,
                 :sender_name,
                 :pickup_line1,
                 :pickup_line2,
                 :pickup_postcode,
                 :recipient_name,
                 :dropoff_line1,
                 :dropoff_line2,
                 :dropoff_postcode,
                 :status])
  end

end
