class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @deliveries = current_user.deliveries
    render :json => @deliveries
  end


end
