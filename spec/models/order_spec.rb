require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'post_codeとshipping_area_idとmunicipalitiesとhouse_numberとtelephone_numberが存在すれば出品できる' do
        expect(@address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空では登録できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post_code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post_code can't be blank")
      end
      it 'shipping_areaが1では登録できない' do
        @address.shippimg_area_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include('Shipping_areay must be other than 1')
      end
      it 'municipalitiesが空では登録できない' do
        @address.municipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House_number can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone_number can't be blank")
      end
      it 'telephone_numberは10桁以上11桁以内の半角数値でなければ登録できない' do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone_number can't be blank")
      end
    end
  end
end
