class ItemsController < ApplicationController
  def index
    # @items = Item.all # 例として、全てのItemを取得
  end

  def new
    @item = Item.new
  end
end
