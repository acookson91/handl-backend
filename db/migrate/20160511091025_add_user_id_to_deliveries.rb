class AddUserIdToDeliveries < ActiveRecord::Migration
  def change
    add_reference :deliveries, :user, index: true, foreign_key: true
  end
end
