class MypagesController < ApplicationController

# before_action :update_params, only: [:update, :edit]
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

  def edit
    # @item = Item.find(params[:id])
    @user = User.find(params[:id]) 
    # @address = Address.find(params[:id])
  end

# def update
#     @user = User.find(params[:id])
#     if @user.id == current_user.id
#       current_user.update(user_params)
#       redirect_to profile_user_path, notice: 'プロフィールを更新しました'
#     else
#       redirect_to profile_user_path, notice: "編集に失敗しました"
#     end
#   end
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
  #  @user = User.find(params[:id]) 
  end

  def card_create
  end

  def personal
#  @user = User.find(params[:id]) 
  end

  def logout
  end

  private

  def update_params
    params.require(:user).permit(:nickname, :introduction)
  end

end
