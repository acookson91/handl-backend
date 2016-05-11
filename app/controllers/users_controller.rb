class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @deliveries = current_user.deliveries
    @handlr_deliveries = Delivery.where(handlr_id: current_user.id)
    p @deliveries
    p @handlr_deliveries

    render :json => [@deliveries, @handlr_deliveries]
  end


end
