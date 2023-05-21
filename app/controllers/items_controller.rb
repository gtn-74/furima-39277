class ItemsController < ApplicationController

  def index
    #@items = Item.order("category_id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :sale_id, :shopping_id, :prefecture_id, :shopping_day_id, :price).merge(user_id: current_user.id)
  end
end
