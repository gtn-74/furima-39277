require 'rails_helper'
RSpec.describe User, type: :model do
  # FactoryBot.build(:user)の記述をbeforeに集約
  # user.カラムのuserを@userに変更
  before  do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12346'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password",
                                                      'Password is too short (minimum is 6 characters)'
      end
      # ここ良くわからん
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordは英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordは英数字混合でなければ登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'パスワード111'
          @user.password_confirmation = 'パスワード111'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name  Input full-width katakana characters'
      end

      it 'family_nameが半角では登録できない' do
        @user.family_name = 'ｵｳｷﾞﾀﾆ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name  Input full-width katakana characters'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name  Input full-width katakana characters'
      end

      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ﾘｮｳｽｹ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name  Input full-width katakana characters'
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana  Input full-width katakana characters'
      end

      it 'family_name_kanaが全角では登録できない' do
        @user.family_name_kana = '扇谷'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana  Input full-width katakana characters'
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana  Input full-width katakana characters'
      end
      it 'first_name_kanaが全角では登録できない' do
        @user.first_name_kana = '諒祐'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana  Input full-width katakana characters'
      end

      it '生年月日が空では登録できない' do
        @user.birth_day = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
