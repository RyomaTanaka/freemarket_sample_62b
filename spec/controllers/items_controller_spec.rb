require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before do
    @user = FactoryBot.create(:user )
    @another_user = FactoryBot.create(:another_user)
    @item = FactoryBot.create(:item)
    @another_item = FactoryBot.create(:another_item)
    @image = FactoryBot.create(:image)
          
  end

    describe "DELETE #destroy " do
      context "as an authorized user"  
      it "アイテムを削除出来るか" do
        sign_in @user
        expect{
        delete :destroy,params:{ id: @item.id }
      }.to_not change(@user.items, :count)
      end
      it "削除した後、マイページへリダイレクトするか" do
        sign_in @user
        delete :destroy, params:{ id: @item.id } #前提条件を上二行で行なっている。このうえで以下に期待する処理をかく
        expect(response).to redirect_to list_items_mypage_path
      end
      
      context "as an unauthorized user" 
      it "アイテム出品したユーザーだけがアイテムを削除出来る" do
      sign_in @user
      
      expect{
        delete :destroy, params:{ id: @another_item.id}
      }.to_not change(@another_user.items, :count)
      end
      
    context "as a guest user" do
      # 302レスポンスを返すか？
      it "returns a 302 response" do
        delete :destroy, params: {id: @item.id}
        expect(response).to have_http_status "302"
      end
    end
  end
end
