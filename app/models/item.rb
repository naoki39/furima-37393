class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
