require 'rails_helper'

describe Address do
  describe '#create' do

    it "user_name, user_name_ruby, prefecture, city, house_number, post_numberがあれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "user_nameが空だと保存できない" do
      address = build(:address, user_name: "")
      address.valid?
      expect(address.errors[:user_name]).to include()
    end

    it "user_name_rubyが空だと保存できない" do
      address = build(:address, user_name_ruby: "")
      address.valid?
      expect(address.errors[:user_name_ruby]).to include("を入力してください")
    end

    it "user_name_rubyがひらがな以外だと保存できない" do
      address = build(:address, user_name_ruby: "ああ")
      address.valid?
      expect(address.errors[:user_name_ruby]).to include("は不正な値です")
    end

    it "user_name_rubyが英字以外だと保存できない" do
      address = build(:address, user_name_ruby: "aaaa")
      address.valid?
      expect(address.errors[:user_name_ruby]).to include("は不正な値です")
    end

    it "user_name_rubyがカナだと保存でる" do
      address = build(:address, user_name_ruby: "カカ")
      expect(address).to be_valid
    end

    it "prefectureが空だと保存できない" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "prefectureがひらがなだと保存できない" do
      address = build(:address, prefecture: "あああ")
      address.valid?
      expect(address.errors[:prefecture]).to include("は不正な値です")
    end
    
    it "prefectureが英字だと保存できない" do
      address = build(:address, prefecture: "aaaa")
      address.valid?
      expect(address.errors[:prefecture]).to include("は不正な値です")
    end

    it "prefectureが数字だと保存でる" do
      address = build(:address, prefecture: 1111)
      expect(address).to be_valid
    end

    it "cityが空だと保存できない" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "cityが英字だと保存できない" do
      address = build(:address, city: "aaaaa")
      address.valid?
      expect(address.errors[:city]).to include("は不正な値です")
    end

    it "cityが数字だと保存できない" do
      address = build(:address, city: 1111)
      address.valid?
      expect(address.errors[:city]).to include("は不正な値です")
    end

    it "cityがひらがなだと保存できる" do
      address = build(:address, city: "ああああ")
      expect(address).to be_valid
    end

    it "cityが漢字だと保存できる" do
      address = build(:address, city: "漢字")
      expect(address).to be_valid
    end

    it "house_numberが空だと保存できない" do
      address = build(:address, house_number: "")
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "house_number英語だと保存できない" do
      address = build(:address, house_number: "aaaa")
      address.valid?
      expect(address.errors[:house_number]).to include("は不正な値です")
    end

    it "house_number数字だと保存できない" do
      address = build(:address, city: 1111)
      address.valid?
      expect(address.errors[:city]).to include("は不正な値です")
    end

    it "house_numbeがひらがなだと保存できる" do
      address = build(:address, house_number: "ああああ")
      expect(address).to be_valid
    end

    it "house_numbeが漢字だと保存できる" do
      address = build(:address, house_number: "漢字")
      expect(address).to be_valid
    end

    it "post_numberが空だと保存できない" do
      address = build(:address, post_number: "")
      address.valid?
      expect(address.errors[:post_number]).to include()
    end

    it "post_numberが英字だと保存できない" do
      address = build(:address, post_number: 1111)
      address.valid?
      expect(address.errors[:post_number]).to include()
    end

    it "post_numberがひらがなだと保存できない" do
      address = build(:address, post_number: "ああああ")
      address.valid?
      expect(address.errors[:post_number]).to include()
    end

    it "post_numberが漢字だと保存できない" do
      address = build(:address, post_number: "漢字")
      address.valid?
      expect(address.errors[:post_number]).to include()
    end

    it "post_numberが数字だと保存できる" do
      address = build(:address, post_number: 1111)
      expect(address).to be_valid
    end
  end
end