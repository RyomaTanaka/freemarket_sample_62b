class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :purchase]
  def index
    @items = Item.all.limit(10).order("created_at DESC")
    @images = Image.all
  end

  def show
  end

  def new
  end

  def purchase
  end

  private
  def set_item
    @item = Item.includes(:images).find(params[:id])
  end

end
