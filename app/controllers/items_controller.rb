class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(10)
    @image = Image.find(1)
  end
end
