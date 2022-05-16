require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "全ての項目が入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
      end
      
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カタカナを使用してください")
      end
      
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナを使用してください")
      end
      
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      
      it "nicknameが40文字以上では登録できない" do
        @user.nickname = "01234567890123456789012345678901234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      
      it "重複したemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "emailは@を含まないと登録できない" do
        @user.email = "testemail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it "passwordが5文字以下では登録できない" do
        @user.password = "ab123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordは半角英数字を含まないと登録できない（数字のみver）" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
      end
      
      it "passwordは半角英数字を含まないと登録できない（英字のみver）" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
      end

      it "全角文字を含むpasswordでは登録できない" do
        @user.password = "テストpass"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
      end
      
      it "passwordとencrypted_passwordが不一致では登録できない" do
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "last_nameは全角の漢字・ひらがな・カタカナでなければ登録できない" do
        @user.last_name = "name"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      
      it "first_nameは全角の漢字・ひらがな・カタカナでなければ登録できない" do
        @user.first_name = "name"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      
      it "last_name_kanaは全角カナでなければ登録できない" do
        @user.last_name_kana = "名前"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      
      it "first_name_kanaは全角カナでなければ登録できない" do
        @user.first_name_kana = "名前"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
    end
  end
end