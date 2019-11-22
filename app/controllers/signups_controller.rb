class SignupsController < ApplicationController
  def step0
  end
  
  def step1
    @user = User.new
  end

  def step2
    user_params[:password] = Devise.friendly_token.first(8) if user_params[:password].blank?
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_ruby] = user_params[:family_name_ruby]
    session[:first_name_ruby] = user_params[:first_name_ruby]
    session[:birth_year] = Date.new(user_params["birth_date(1i)"]&.to_i)
    session[:birth_month] = Date.new(user_params["birth_date(2i)"]&.to_i)
    session[:birth_day] = Date.new(user_params["birth_date(3i)"]&.to_i)
  end
  
  def step3
    @address = Address.new
  end

  def step4
    @card = Card.new
  end

  def create
    session[:user_name] = address_params[:user_name]
    session[:user_name_ruby] = address_params[:user_name_ruby]
    session[:post_number] = address_params[:post_number]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
    session[:phone_number] = address_params[:phone_number]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_ruby: session[:family_name_ruby],
      first_name_ruby: session[:first_name_ruby],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )

    if @user.save
      session[:user_id] = @user.id
      sign_in User.find(@user.id) unless user_signed_in?
    end
    
    @address = Address.new(
      user_id: session[:user_id],
      user_name: session[:user_name],
      user_name_ruby: session[:user_name_ruby],
      post_number: session[:post_number],
      prefecture: session[:prefecture],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      phone_number: session[:phone_number]
    )
    @address.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_name_ruby,
      :first_name_ruby,
      :birth_date
    )
  end

  def address_params
    params.require(:address).permit(
      :user_id,
      :user_name,
      :user_name_ruby,
      :post_number,
      :prefecture,
      :city,
      :house_number,
      :building_name,
      :phone_number
    )
  end
end
