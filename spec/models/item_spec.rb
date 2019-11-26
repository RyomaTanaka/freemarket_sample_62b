require 'rails_helper'

describe ItemsController do
  describe "DELETE #destroy " #HTTPメソッド名 #アクション名
  it "delete item" do #何をテストする内容か？
    delete :destroy,params:{ id: 1 }
  end

end


