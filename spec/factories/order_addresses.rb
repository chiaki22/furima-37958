FactoryBot.define do
  factory :order_address do
    postal_code   { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '中央区' }
    address       { '1' }
    building      { '日比谷フォートタワー' }
    phone         { '11111111111' }
    token         { 'tok_abc0000000000000000000' }
  end
end
