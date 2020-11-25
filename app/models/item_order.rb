class ItemOrder
  include ActiveModel::ActiveModel
  attr_accessor :user, :item, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :order

  with_options presence: true do
    validates :user, :item, :postal_code, :prefecture, :city, :house_number, :phone_number, :order
  end

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, :city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end