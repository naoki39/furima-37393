class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  
  def index
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


  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :state_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: currnt_user.id )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
