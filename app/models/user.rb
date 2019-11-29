class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :sns_authentications, dependent: :destroy
  has_many :items, dependent: :destroy
  # accepts_nested_attributes_for :addresses, :profile

  # ----------------------------------------
  # has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,

         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 7..128 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_ruby, presence: true,
            format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :family_name_ruby, presence: true, 
            format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

  # SNS認証情報がない場合
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

    if user.present?
      sns = SnsAuthentication.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
      sns = SnsAuthentication.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end

    return { user: user ,sns: sns}
  end

  # SNS認証情報がある場合
  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsAuthentication.where(uid: uid, provider: provider).first
    # SNS認証情報があるかないか？
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

end
