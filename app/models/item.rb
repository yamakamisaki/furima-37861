class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :condition, :shipping_fee, :prefecture, :send_day]

  with_options presence: true do
    validates :title
    validates :text
    # 半角数字・¥300~¥9,999,999の間のみ保存可能
    validates :price, format: { with: /\d{300,9999999}/ }

    # ActiveHashのid:1は保存できない  { id: 1, name: '--' }
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :shipping_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :send_day_id, numericality: { other_than: 1 } 
  end
end
