class DeliveriesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    render json: Delivery.all
  end

  def create
    respond_with current_user.deliveries.create(delivery_params)
  end

  def show
    render json: Delivery.find(params[:id])
  end

  def update
    p delivery_params

     respond_with Delivery.find(params[:id]).update(delivery_params)
  end

  private

  def delivery_params
    params.permit(:sender_name,
                  :pickup_line1,
                  :pickup_line2,
                  :pickup_postcode,
                  :recipient_name,
                  :dropoff_line1,
                  :dropoff_line2,
                  :dropoff_postcode,
                  :status,
                  :handlr_id)
  end
end
