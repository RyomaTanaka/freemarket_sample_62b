class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: :index
  
  def index
  end

  def new
  end

  def show
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(current_user.card.customer_id)
    @user_card = customer.cards.retrieve(current_user.card.card_id)
  end
  
  def create
    # APIkeyを読み込みAPIを使用できるようにする
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    
    # 顧客情報を作成
    customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
    )
    
    # payjpから返って来た値からカード情報を作成
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    @card.save
  end
  
  def destroy
    customer = Payjp::Customer.retrieve(current_user.card.customer_id)
    user_card = customer.cards.retrieve(current_user.card.card_id)
    user_card.delete
    card = Card.where(user_id: current_user.id).first
    card.delete
    redirect_to user_cards_path(current_user)
  end
  
  private

  def set_card
    redirect_to user_card_path(current_user, current_user.card.id) if current_user.card.present?
  end

end