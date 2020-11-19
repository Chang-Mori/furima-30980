class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.repuire(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_charges_id, :shipment_source_id, :days_to_ship_id, :price)
  end
end
