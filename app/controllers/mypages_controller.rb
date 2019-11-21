class MypagesController < ApplicationController
  def index
  end

  def logout
  end

  def credit_registration
  end

  def personal
  end

  def profile_edit
  end

  def exhibited
    @item = Item.find(params[:id])
  end

  def item_edit
  end


end
