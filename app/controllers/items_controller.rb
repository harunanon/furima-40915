class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  def show
    @item = Item.find_by(id: params[:id])
    end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :price, :genre_id, :quality_id, :payment_id, :delivery_day_id,
                                 :region_of_origin_id, :image).merge(user_id: current_user.id)
  end
end