require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: item.user.id, item_id: item.id)
      sleep 0.1
    end
    context '商品購入がうまくいくとき' do
      it 'user_idとitem_idが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'post_codeとregion_of_origin_idとmunicipalityとstreet_addressとphone_number_とorder_idが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'post_codeがハイフン含めた7桁の数字なら登録できる' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁の数字なら登録できる' do
        @order_address.phone_number = '12345678901'
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'user_idが空では保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では保存できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'region_of_origin_idが空では保存できないこと' do
        @order_address.region_of_origin_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'municipalityが空では保存できないこと' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空では保存できないこと' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "region_of_origin_idの値が、id:1,name:'--'の時は保存できないこと" do
        @order_address.region_of_origin_id = [1]
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'post_codeが6桁以下だと登録できないこと' do
        @order_address.post_code = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが8桁以上だと登録できないこと' do
        @order_address.post_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeがハイフンがないと登録できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが9桁以下の数字なら登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Include 10-11 digits')
      end
      it 'phone_numberが12桁以上の数字なら登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Include 10-11 digits')
      end
    end
  end
end
