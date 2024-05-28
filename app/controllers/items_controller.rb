class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all # 例として、全てのItemを取得
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :genre_id, :quality_id, :payment_id, :delivery_day_id,
                                 :region_of_origin_id, :image).merge(user_id: current_user.id)
  end
end
