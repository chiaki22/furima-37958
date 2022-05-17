class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category, :item_status, :shipping_fee, :prefecture, :scheduled_delivery

  with_options presence: true do
    validates :image, :item_name, :item_info, :item_category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
    validates :item_name, length: {maximum: 40}
    validates :item_info, length: {maximum: 1000}
    validates :item_category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 ,message:"を選択してください"} 
    validates :price, numericality:{only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999, message:"は300円以上9,999,999円以内で入力してください"}
  end

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message:"には半角数字を使用してください"

end
