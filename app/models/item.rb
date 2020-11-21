class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_one :order_log

  validates :image, :name, :explanation, presence: true
  validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :status_id, :shipping_charges_id, :shipment_source_id, :days_to_ship_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :days_to_ship

end
