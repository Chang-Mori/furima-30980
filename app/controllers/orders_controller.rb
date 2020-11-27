class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id
      @item_order = ItemOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
