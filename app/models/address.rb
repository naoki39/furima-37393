class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true, numericality: {only_integer: true, }, format: {with: /[0-9]{10,11}/ }
end

