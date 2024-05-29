class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_item_owner, only: [:edit, :update, :destroy]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find_by(id: params[:id])
    end

    def edit
    end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_owner
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :price, :genre_id, :quality_id, :payment_id, :delivery_day_id,
                                 :region_of_origin_id, :image).merge(user_id: current_user.id)
  end
end