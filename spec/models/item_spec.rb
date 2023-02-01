require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録ができる時' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録できない時' do
      it 'imageが空では登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Description can't be blank")
      end
      it 'category_idが「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'condition_idが「---」では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Condition can't be blank")
      end
      it 'shipping_charge_idが「---」では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Shipping charge can't be blank")
      end
      it 'prefecture_idが「---」では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Prefecture can't be blank")
      end
      it 'days_to_ship_idが「---」では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Days to ship can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Price can't be blank")
      end
      it 'priceが300より少ないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より多いと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include  ("Price is not a number")
      end
    end
  end
end