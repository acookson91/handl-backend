class Delivery < ActiveRecord::Base

  def as_json(options={})
    super(only: [:id, :recipient, :pickup_address, :dropoff_address, :status])
  end

end
