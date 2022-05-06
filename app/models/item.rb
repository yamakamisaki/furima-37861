class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :condition, :shipping_fee, :prefecture, :send_day]


end
