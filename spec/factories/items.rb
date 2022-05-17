FactoryBot.define do
  factory :item do
    item_name             { Faker::Commerce.product_name }
    item_info             { Faker::Lorem.sentence }
    item_category_id      { Faker::Number.between(from: 2, to: 11) }
    item_status_id        { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id       { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
