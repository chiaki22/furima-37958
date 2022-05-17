class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category, :item_status, :shipping_fee, :prefecture, :scheduled_delivery

  with_options presence: true do
    validates :image, :item_category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
    validates :item_name, length: { maximum: 40 }
    validates :item_info, length: { maximum: 1000 }
    validates :item_category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
              numericality: { other_than: 1, message: 'Please select' }
  end

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price,
            presence: true,
            format: { with: PRICE_REGEX, allow_blank: true },
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            allow_blank: true }
end
