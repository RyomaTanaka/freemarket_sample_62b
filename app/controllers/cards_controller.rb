class CardsController < ApplicationController
  require 'payjp'
  # before_action :set_card

  def new
    # card = Card.where(user_id: current_user.id).first
    # redirect_to action: "index" if card.present?
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    token = Payjp::Token.create({
      card: {
        number: params[:card_number],
        cvc: params[:card_cvc],
        exp_year: params[:card_exp_year],
        exp_month: params[:card_exp_month],
      }},
      {'X-Payjp-Direct-Token-Generate': 'true'}
    )

    puts token.id

    redirect_to root_path
    # if params['payjp-token'].blank?
    #   redirect_to action: "new"
    # else
    #   customer = Payjp::Customer.create(
    #     email: current_user.email,
    #     card: params['payjp-token']
    #   )
    #   @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    #   if @card.save
    #     redirect_to action: "index"
    #   else
    #     redirect_to action: "create"
    #   end
    # end
  end
  
  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end