class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipalities, :house_number, :building_name, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :house_number
    validates :telephone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end