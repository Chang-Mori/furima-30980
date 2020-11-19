class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :days_to_ship

  belongs_to :user
  has_one :order_log

  validates :name, :explanation, :price, presence: true

  validates :category_id, :status_id, :shipping_charges_id, :shipment_source_id, :days_to_ship_id, numericality: { other_than: 1 } 
end
