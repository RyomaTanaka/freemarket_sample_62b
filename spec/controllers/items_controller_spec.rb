require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
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
