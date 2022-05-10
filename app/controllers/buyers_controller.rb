class BuyersController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
       @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
       @buyer_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id,
                                          :city, :home_address, :building_name,
                                          :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

