class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    #@order = Order.create(order_params)
    #Address.create(address_params)
  end

  private
  #def order_params
    #params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  

  #def address_params
    #params.require(:address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(order_id: @order.id)
  
end
