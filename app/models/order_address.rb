class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :municipalities, :house_number, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :house_number
    validates :telephone_number, numericality: { only_integer: true }, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities,
                   house_number: house_number, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
