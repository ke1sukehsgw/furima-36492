FactoryBot.define do
  factory :buy_delivery do
    postal_code {'123-4567'}
    shipping_area_id {1}
    municipalities {Faker::Lorem.sentence}
    house_number {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    telephone_number {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    association :user, :item
  end
end
