require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before  do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end

    context '商品登録ができる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      context '商品登録ができない場合' do
        it '商品画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end
        it '商品名が空では録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end
        it '商品説明文が空では登録できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Content can't be blank"
        end
        it 'カテゴリが1では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it '商品状態が1では登録できない' do
          @item.sale_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Sale can't be blank"
        end
        it '配送費の負担が1では登録できない' do
          @item.shopping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shopping can't be blank"
        end
        it '地域が1では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture can't be blank"
        end
        it '発送日数が1では登録できない' do
          @item.shopping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shopping day can't be blank"
        end
        it '販売価格が空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end
        it '販売価格が全角では登録できない' do
          @item.price = '５５５５'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Price is not a number'
        end
        it '販売価格が300円未満では出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
        end
        it '販売価格が10,000,000円を超過すると出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
        end
        it 'userが紐づいていない場合登録できない' do
          @item.user_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end
      end
    end
  end
end
