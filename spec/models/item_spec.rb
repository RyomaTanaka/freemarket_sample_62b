require 'rails_helper'

describe Item do
  describe '#create' do

    it "user, name, body, price, status, method, cost_burden, period_before_shipping, prefecture_idの値があれば出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "userがないと出品できないこと" do
      item = build(:item, user: nil)
      item.valid?
      expect(item.errors[:user]).to include("を入力してください")
    end

    it "nameがないと出品できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "nameが40文字以上だと出品できない " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include()
    end

    it "nameが40文字以下だと出品できる " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "bodyがないと出品できないこと" do
      item = build(:item, body: nil)
      item.valid?
      expect(item.errors[:body]).to include("を入力してください")
    end

    it "priceがないと出品できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "statusがないと出品できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "shipping_methodがないと出品できないこと" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it "cost_burdenがないと出品できないこと" do
      item = build(:item, cost_burden: nil)
      item.valid?
      expect(item.errors[:cost_burden]).to include("を入力してください")
    end

    it "period_before_shippingがないと出品できないこと" do
      item = build(:item, period_before_shipping: nil)
      item.valid?
      expect(item.errors[:period_before_shipping]).to include("を入力してください")
    end

    it "period_before_shippingがないと出品できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
  end
end