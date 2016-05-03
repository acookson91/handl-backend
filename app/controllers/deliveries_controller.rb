class DeliveriesController < ApplicationController



  def index
    render :json => Delivery.all
  end

end
