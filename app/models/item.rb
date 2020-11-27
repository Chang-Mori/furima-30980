class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_one :order



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :days_to_ship

end
