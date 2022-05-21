require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が全角だと購入できない' do
        @order_address.postal_code = '１１１−１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code 半角数値で3桁ハイフン(-)4桁の形式で入力してください')
      end
      it '郵便番号が数字以外だと購入できない' do
        @order_address.postal_code = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code 半角数値で3桁ハイフン(-)4桁の形式で入力してください')
      end
      it '郵便番号は3桁ハイフン(-)4桁でないと購入できない' do
        @order_address.postal_code = '1111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code 半角数値で3桁ハイフン(-)4桁の形式で入力してください')
      end
      it '都道府県が「---」(id = 1)では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Please select')
      end
      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が全角では購入できない' do
        @order_address.phone = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone 10桁以上11桁以内の半角数値で入力してください　ハイフン(-)の入力不可')
      end
      it '電話番号に数字以外が入力されていると購入できない' do
        @order_address.phone = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone 10桁以上11桁以内の半角数値で入力してください　ハイフン(-)の入力不可')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
