require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #new' do
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end
end