require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name.image,price,user,text,genre_id,payment_id,region_of_origin_id,delivery_days_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空では保存できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'userが紐付いていなければ保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'カテゴリーが「---」の場合は出品できないこと' do
        @item.genre_id = 0 # ここで「---」のidを指定
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 0")
      end

      it '商品の状態が「---」の場合は出品できないこと' do
        @item.quality_id = 0 # ここで「---」のidを指定
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality must be other than 0")
      end

      it '配送料の負担が「---」の場合は出品できないこと' do
        @item.payment_id = 0 # ここで「---」のidを指定
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment must be other than 0")
      end

      it '発送元の地域が「---」の場合は出品できないこと' do
        @item.region_of_origin_id = 0 # ここで「---」のidを指定
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin must be other than 0")
      end

      it '発送までの日数が「---」の場合は出品できないこと' do
        @item.delivery_day_id = 0 # ここで「---」のidを指定
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end
    end
  end
end
