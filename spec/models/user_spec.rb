require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it '半角英数字混合のpasswordではないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it '英字のみのpasswordでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it '数字のみのpasswordでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it '全角文字を含むpasswordでは登録できない' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'fist_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'hasegawa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'keisuke'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'はせがわ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'けいすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
    end
    it 'birthdqayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end

RSpec.describe 'ユーザーログイン', type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ユーザーログインできるとき' do
    it 'emailとpasswordが存在すればログインできる' do
      expect(@user).to be_valid
    end
  end
  context 'ユーザーログインできないとき' do
    it 'emailが空ではログインできない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空ではログインできない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
  end
end
