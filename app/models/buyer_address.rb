class BuyerAddress


  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :city, :home_address, :building_name, 
                :telephone_number, :buyer_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :home_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end
    # ActiveHashのid:1は保存できない  { id: 1, name: '--' }
    validates :prefecture_id, numericality: { other_than: 1 }

    def save
      buyer = Buyer.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                     home_address: home_address, building_name: building_name, 
                     telephone_number: telephone_number, buyer_id: buyer.id)
    end

  end
