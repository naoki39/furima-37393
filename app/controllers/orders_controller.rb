class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_code, :shipping_area_id, :municipalities, :house_number, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    order = Item.find(order_params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
