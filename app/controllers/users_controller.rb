class UsersController < ApplicationController
# before_action :set_params, only: [:show]
  include CommonActions
  before_action :set_category, only: [:index, new, :show]
  def index
  end

  def new
  end

  def show
  end

end

