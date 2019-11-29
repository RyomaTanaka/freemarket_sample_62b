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

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空だと保存できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "passwordが7文字以下だと保存できない" do
      user = build(:user, password: "11111a")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "passwordが半角英数字以外だと保存できない" do
      user = build(:user, password: "ああああああああ")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "passwordが7文字以上だと保存できる" do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが128文字以上だと保存できない" do
      user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "passwordが128文字以内だと保存できる" do
      user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user).to be_valid
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

    it "first_name_rubyが空だと保存できない" do
      user = build(:user, first_name_ruby: "")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("を入力してください")
    end

    it "first_name_rubyがカナ以外だと保存できない" do
      user = build(:user, first_name_ruby: "あいう")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("は不正な値です")
    end

    it "family_name_rubyがカナ以外だと保存できない" do
      user = build(:user, family_name_ruby: "aaa")
      user.valid?
      expect(user.errors[:family_name_ruby]).to include("は不正な値です")
    end

    it "birth_yearが空だと保存できない" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "birth_monthが空だと保存できない" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "birth_dayが空だと保存できない" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
  end
end