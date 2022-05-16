class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image,                  presence: true
  validates :item_name,              presence: true, length: {maximum: 40}
  validates :item_info,              presence: true, length: {maximum: 1000}
  validates :item_category_id,       numericality: { other_than: 1 , message: "カテゴリーを選択してください"} 
  validates :item_status_id,         numericality: { other_than: 1 , message: "商品の状態を選択してください"} 
  validates :shipping_fee_id,        numericality: { other_than: 1 , message: "配送料の負担を選択してください"} 
  validates :prefecture_id,          numericality: { other_than: 1 , message: "発送元の地域を選択してください"} 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 , message: "発送までの日数を選択してください"} 

  with_options presence: true,format:{with: /\A[0-9]+\z/, message: '全角数字を使用してください'} do
    validates :price,numericality:{only_integer: true, in:300..9999999}
  end

end
