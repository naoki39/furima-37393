require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
      end
    end
    context 'ユーザーの新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
      it 'emalは@を含まないと登録できない' do
      end
      it 'passwordは６文字以上じゃないと登録できない' do
      end
      it 'passwordは半角英数字を含まないと登録できない' do
      end
      it '重複したemalが存在する場合は登録できない' do
      end
      it 'first_nameとlast_nameは全角（漢字・ひらがな・カタカナ）ではないと登録できない' do
      end
      it 'first_name_kanaとlast_name_kanaは全角（カタカナ）ではないと登録できない' do
      end
    end
  end
end
