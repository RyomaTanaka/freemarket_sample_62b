class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @items = Item.where(user_id: current_user)
 end

 def exhibited_lists
    @items = Item.where(user_id: current_user = "1")
 end

  def exhibited
    @items = Item.where(user_id: current_user = "1")
  end

  def profile_edit
        @items = Item.where(user_id: "1")
  end

  def logout
        @items = Item.where(user_id: "1")
  end

  def personal
        @items = Item.where(user_id: "1")
  end

  def credit_registration
        @items = Item.where(user_id: "1")
  end


  
end
