class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item_id, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
    redirect_to root_path if @item.buyer.present? || current_user.id == @item.user_id
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id,
                                          :city, :home_address, :building_name,
                                          :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price, # 商品の値段
      card: buyer_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
