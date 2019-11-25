class MypagesController < ApplicationController

  def list_items
        @items = Item.all
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
    #  @item = Item.find(params[:id])
    # @users = User.find(:nickname)

    # if @item.update(update_item_params)

    #   redirect_to root_path
    # end

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
