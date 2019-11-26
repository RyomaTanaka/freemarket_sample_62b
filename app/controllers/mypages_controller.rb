class MypagesController < ApplicationController
  def list_items
        @items = Item.all.order("crated_at DESC")
        @images = Image.all
  end

  def list_items_progress
  end

  def list_items_completed
  end

  def purchase
  end

  def purchased
  end

  def profile
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def card
  end

  def card_create
  end

  def personal
  end

  def logout
  end

end
