class ItemsController < ApplicationController
  def index
    @item = Item.all.order("created_at DESC").limit(10)
  end

  def show
  end

  def new
  end

  def purchase
  end

end
