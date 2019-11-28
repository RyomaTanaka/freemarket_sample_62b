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