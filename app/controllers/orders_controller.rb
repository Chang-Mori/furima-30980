class OrdersController < ApplicationController
  def index
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to action: index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:user, :item, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :order)
end
