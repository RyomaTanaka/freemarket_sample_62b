require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #new' do
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
      end
      # 正常に記事を作成できるか？
      it 'saves the new message in the database' do
        expect{post :create, params}.to change(Items, :count).by(1)
      end
    end
  end
end