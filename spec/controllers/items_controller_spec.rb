require 'rails_helper'


describe ItemsController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #new' do
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end

  describe 'Post #create' do
    let(:params) { { user_id: user.id, item: attributes_for(:item), image: attributes_for(:image) } }

    context 'log in' do
      before do
        login user
      end

    context 'can save' do
      subject {
        post :create,
        params: params
      }

      it 'count up item' do
        expect{ subject }.to change(Item, :count).by(1)
      end

      it 'redirects to items_path' do
        subject
        expect(response).to redirect_to(action: :index)
      end
    end

    context 'can not save' do
      let(:invalid_params) { { user_id: user.id, item: attributes_for(:item, name: nil), image: attributes_for(:image, image: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Item, :count)
        end

        it 'redirects to items_path' do
          subject
          expect(response).to redirect_to(action: :new)
        end
      end
    end
  end
end



before do
  @user = FactoryBot.create(:user )
  @item = FactoryBot.create(:item)
  @image = FactoryBot.create(:image)

end

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3)
        get :index
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
      end

  RSpec.describe ItemsController, type: :controller do

    before do
      @user = FactoryBot.create(:user )
      @item = FactoryBot.create(:item)
      @image = FactoryBot.create(:image)

    end



  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3)
        get :index
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
      end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
    end
    it "renders the :show template" do
        get :show, params: {  id: @item.id }
        expect(response).to be_success
    end
    it "renders the :show template" do
      get :show, params: {  id: @item.id }
      expect(response).to render_template :show
    end
  end
end



        describe "DELETE #destroy " do
          it "アイテムを削除出来るか" do
            sign_in @user
            expect{
            delete :destroy,params:{ id: @item.id }
          }.to change(@user.items, :count).by(-1)
        end
      end
  end
