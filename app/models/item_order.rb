class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, :city, :house_number, :phone_number, :image, :name, :explanation
  end

  validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :status_id, :shipping_charge_id, :shipment_source_id, :days_to_ship_id, :prefecture_id, numericality: { other_than: 1 } 
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    #order.id => 1
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end