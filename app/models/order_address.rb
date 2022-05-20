class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building,:phone,:item_id,:user_id

  with_options presence: true do
    validates :user_id, :item_id, :city, :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)", allow_blank: true}
    validates :prefecture_id, numericality:{ other_than: 1, message: 'Please select' }
    validates :phone, format: {with: /\A[0-9]{10,11}\z/, message: "10桁以上11桁以内の半角数値のみで記載してください", allow_blank: true}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end

end