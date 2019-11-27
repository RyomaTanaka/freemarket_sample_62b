require 'rails_helper'

describe Item do
  describe '#create' do

  it "user, body, price, status, method, cost_burden, period_before_shipping, prefecture_idの値があれば出品できる" do
    item = build(:item)
    expect(item).to be_valid
  end

    # it "nameがないと出品できないこと" do
    #   item = build(:item, name: nil)
    #   item.valid?
    #   expect(item.errors[:name]).to include("can't be blank")
    # end
  end
end