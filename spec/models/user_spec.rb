require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録/ユーザー情報 ' do
    context '新規登録できるとき' do
      it '全ての値が存在するとき' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123a5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合ではない場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456a'
        @user.password_confirmation = '123456b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の名字と名前がない場合は登録できない' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid',
                                                      "Last name can't be blank", 'Last name is invalid')
      end
      it 'お名前(全角)が全角でない場合は登録できない' do
        @user.first_name = 'test'
        @user.last_name  = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid', 'Last name is invalid')
      end
      it 'お名前カナ(全角)の名字と名前がない場合は登録できない' do
        @user.first_name_kana = ''
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid',
                                                      "Last name kana can't be blank", 'Last name kana is invalid')
      end
      it 'お名前カナ(全角)が全角カナでない場合は登録できない' do
        @user.first_name_kana = 'てすと'
        @user.last_name_kana  = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid', 'Last name kana is invalid')
      end
      it '生年月日がない場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = 'aaaaaあ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
