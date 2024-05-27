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
      it 'genre_idが空では保存できないこと' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'quality_idが空では保存できないこと' do
        @item.quality_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'payment_idが空では保存できないこと' do
        @item.payment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'region_of_origin_idが空では保存できないこと' do
        @item.region_of_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'delivery_day_idが空では保存できないこと' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it "genre_idの値が、id: 0,name:'--'の時は保存できないこと" do
        @item.genre_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank", 'Genre is not a number')
      end
      it "quality_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.quality_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank", 'Quality is not a number')
      end
      it "payment_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.payment_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank", 'Payment is not a number')
      end
      it "region_of_origin_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.region_of_origin_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be blank", 'Region of origin is not a number')
      end
      it "delivery_day_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.delivery_day_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day is not a number')
      end
    end
  end
end
