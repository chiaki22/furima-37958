FactoryBot.define do
  factory :user do
    nickname           { 'test' }
    email              { Faker::Internet.free_email }
    password           { 'test00' }
    encrypted_password { 'test00' }
    last_name          { '山田' }
    first_name         { '花子' }
    last_name_kana     { 'ヤマダ' }
    first_name_kana    { 'ハナコ' }
    birth_date         { '2000-10-10' }
  end
end
