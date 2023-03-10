require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code は「-」(ハイフン)を入れた半角数字で入力してください")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code は「-」(ハイフン)を入れた半角数字で入力してください')
      end
      it '郵便番号が8桁出ないと購入できない' do
        @item_order.postal_code = '123-45678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code は「-」(ハイフン)を入れた半角数字で入力してください')
      end
      it '郵便番号が全角だと購入できない' do
        @item_order.postal_code = '１２３-４５６７'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code は「-」(ハイフン)を入れた半角数字で入力してください')
      end
      it 'prefecture_idが空だと購入できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @item_order.block = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @item_order.telephone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @item_order.telephone_number = '080123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @item_order.telephone_number = '080123456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @item_order.telephone_number = '0８012345678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'userが紐付いていなければ購入できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
