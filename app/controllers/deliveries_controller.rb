class DeliveriesController < ApplicationController

  def index
    render json: Delivery.all
  end

  def create
    Delivery.create(delivery_params)
  end

  private

  def delivery_params
    params.require(:delivery).permit(:recipient, :pickup_address, :dropoff_address, :status)
  end
end
