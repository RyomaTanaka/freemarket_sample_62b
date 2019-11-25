require 'rails_helper'
describe Item do
  describe '#index' do
    it "データベースの商品の一覧が表示されている" do
      item = Item.new(name: "サンプル", price: "300")
    end
  end
end