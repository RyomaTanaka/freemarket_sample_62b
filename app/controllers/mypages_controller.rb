class MypagesController < ApplicationController

  include CommonActions
  before_action :set_category


# before_action :update_params, only: [:update, :edit]
  def list_items
        @items = Item.all.order("created_at DESC")
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

  def edit
    @user = User.find(params[:id]) 
  end

  def update

    @user = User.find(params[:id])
      if @user = User.find(params[:id])
        @user.update(update_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
    end

  def card
  end

  def card_create
  end

  def logout
  end

  private

  def update_params
    params.require(:user).permit(:nickname, :introduction)
  end

end
