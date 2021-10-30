class Item < ApplicationRecord
  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :delivery_fee_id,  presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user

  validates :category_id, :condition_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" }
end
