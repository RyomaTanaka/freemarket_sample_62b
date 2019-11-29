require 'rails_helper'

describe User do
  describe '#create' do

    it "nickname, email, password, first_name, family_name, first_name_ruby, family_name_ruby, birth_year, birth_month, birth_day,があれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空だと保存できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空だと保存できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空だと保存できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "first_nameが空だと保存できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_nameが空だと保存できない" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_rubyが空だと保存できない" do
      user = build(:user, first_name_ruby: "")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("を入力してください")
    end

    it "family_name_rubyが空だと保存できない" do
      user = build(:user, family_name_ruby: "")
      user.valid?
      expect(user.errors[:family_name_ruby]).to include("を入力してください")
    end

    it "family_name_rubyが空だと保存できない" do
      user = build(:user, first_name_ruby: "")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("を入力してください")
    end

  end
end