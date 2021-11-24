class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :id_params, only: [:index, :create]

  def index
    @buy_delivery = BuyDelivery.new
    if @item.user_id == current_user.id || @item.buy.present?
      redirect_to root_path
    end
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:postal_code, :shipping_area_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def id_params
    @item = Item.find(params[:item_id])
  end
end
