class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
      else
        render :index
      end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(id: params[:item_id])
  end
end




#def donation_params
#params.permit(:price).merge(user_id: current_user.id)
#end

#def address_params
  #params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(order_id: @order.id)
#end