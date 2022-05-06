class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shippingFee, :prefecture, :sendDay

  with_options presence: true do
    validates :title
    validates :image
    # 1~1000文字の範囲のみ保存可能
    validates :text, length: { in: 1..1000 }
    # 半角数字・¥300~¥9,999,999の間のみ保存可能
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
  # ActiveHashのid:1は保存できない  { id: 1, name: '--' }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :send_day_id, numericality: { other_than: 1 }
end
