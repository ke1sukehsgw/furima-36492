require 'rails_helper'

RSpec.describe '商品登録', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '商品登録ができるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品登録ができないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'item_nameが空では登録できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it 'explanationが空では登録できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it 'category_idが0では登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが0では登録できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'delivery_fee_idが0では登録できない' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
    end
    it 'shipping_area_idが0では登録できない' do
      @item.shipping_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area can't be blank"
    end
    it 'shipping_day_idが0では登録できない' do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが¥300以上でないと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it 'priceが¥9,999,999以下でないと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it 'priceに半角数字以外が含まれている場合は登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
  end
end
