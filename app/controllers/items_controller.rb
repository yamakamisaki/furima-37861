class ItemsController < ApplicationController

def index
  # @item = Item.new(item_params)
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
  params.require(:item).permit(:title,:text,:image,:category_id,:condition_id,:shipping_fee_id,:prefecture_id,:send_day_id,:price).merge(user_id: current_user.id)
end

end
