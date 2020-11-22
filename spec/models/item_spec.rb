require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "image,name,explanation,category_id,status_id,shipping_charge_id,shipment_source_id,days_to_ship_id,priceがあれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "出品商品が保存できない場合" do
      it "出品画像が空だと保存できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空では保存できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が空では保存できないこと" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーが空では保存できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "カテゴリーのカラムが「---」(id:1)では保存できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品状態が空では保存できないこと" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it "商品状態のカラムが「---」(id:1)では保存できないこと" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料の負担が空では保存できないこと" do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end

      it "配送料の負担のカラムが「---」(id:1)では保存できないこと" do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it "発送元の地域が空では保存できないこと" do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source is not a number")
      end

      it "発送元の地域のカラムが「---」(id:1)では保存できないこと" do
        @item.shipment_source_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end

      it "発送までの日数が空では保存できないこと" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end

      it "発送までの日数のカラムが「---」(id:1)では保存できないこと" do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
    
      it "販売価格が空では保存できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が300円未満では保存できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格が9999999円超過では保存できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "ユーザーが紐づいていないと出品商品が保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
