require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it '全ての値が存在する場合は購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameの値が空でも購入できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'user_idが空の場合は購入できない' do
        @buyer_address.user_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合は購入できない' do
        @buyer_address.item_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空の場合は購入できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに[-]が含まれていない場合は購入できない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空の場合は購入できない' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1の場合は購入できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空の場合は購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'home_addressが空の場合は購入できない' do
        @buyer_address.home_address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Home address can't be blank")
      end
      it 'telephone_numberが空の場合は購入できない' do
        @buyer_address.telephone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberに数字以外が含まれる場合は購入できない' do
        @buyer_address.telephone_number = '090-123-4567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空の場合は購入できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
