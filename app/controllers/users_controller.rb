class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @items = Item.where(user_id: "1")
  end

end
