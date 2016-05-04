class DeliveriesController < ApplicationController

  def index
    render json: Delivery.all
  end

  def create
    Delivery.create(delivery_params)
  end

  def update
    Delivery.find(params[:id]).update(delivery_params)
  end

  private

  def delivery_params
    params.require(:delivery).permit(:sender_name,
                                     :pickup_line1,
                                     :pickup_line2,
                                     :pickup_postcode,
                                     :recipient_name,
                                     :dropoff_line1,
                                     :dropoff_line2,
                                     :dropoff_postcode,
                                     :status)
  end
end
