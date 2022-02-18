require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    order = FactoryBot.build(:order)
    @order_address = FactoryBot.build(:order_address, order_id: order.id)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'post_codeとshipping_area_idとmunicipalitiesとhouse_numberとtelephone_numberとorder_idとtokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列でなければ購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_areaが1では購入できない' do
        @order_address.shipping_area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'municipalitiesが空では購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは10桁以上11桁以内の半角数値でなければ購入できない' do
        @order_address.telephone_number = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
