require 'rails_helper'

RSpec.describe '商品購入', type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end

  context '内容に問題がない場合' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@buy_delivery).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @buy_delivery.building_name = nil
      expect(@buy_delivery).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できない' do
      @buy_delivery.postal_code = nil
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Postal code can't be blank"
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_delivery.postal_code = '1234567'
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end
    it 'shipping_areaを選択していないと保存できないこと' do
      @buy_delivery.shipping_area_id = 0
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Shipping area can't be blank"
    end
    it 'municipalitiesが空では保存できないこと' do
      @buy_delivery.municipalities = nil
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Municipalities can't be blank"
    end
    it 'house_numberが空では保存できないこと' do
      @buy_delivery.house_number = nil
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "House number can't be blank"
    end
    it 'telephone_numberが空では保存できないこと' do
      @buy_delivery.telephone_number = nil
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Telephone number can't be blank"
    end
    it 'telephone_numberが10桁以上11桁以内の半角数値でないと保存できないこと' do
      @buy_delivery.telephone_number = '080-1234-5678'
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include "Telephone number is invalid"
    end
    it "tokenが空では登録できないこと" do
      @buy_delivery.token = nil
      @buy_delivery.valid?
      expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
    end
  end
end
