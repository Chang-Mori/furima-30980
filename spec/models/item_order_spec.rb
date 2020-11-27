require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入データ保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_order.postal_code = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していないと保存できないこと' do
      @item_order.prefecture_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture is not a number")
    end
    it '都道府県のカラムが「---」(id:1)では保存できないこと' do
      @item_order.prefecture_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '市区町村が空だと保存できないこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名は空でも保存できること' do
      @item_order.building_name = nil
      expect(@item_order).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号がハイフン含めず11桁以内でないと保存できないこと' do
      @item_order.phone_number = '012345678901'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
