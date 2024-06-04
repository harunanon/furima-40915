require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user: @user, item: @item)
    end

    context '商品購入がうまくいくとき' do
      it 'user_idとitem_idが存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'user_idが空では保存できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User_id can't be blank")
    end
    it 'item_idが空では保存できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item_id can't be blank")
    end
  end
end
