FactoryBot.define do
  factory :item_order do
    postal_code                   { '123-4567' }
    prefecture_id                 { 3 }
    city                          { 'テスト市テスト区テスト町' }
    block                         { '1-1-1' }
    building                      { 'ダミービル' }
    telephone_number              { '09000000000' }
    token                         { Faker::Internet.password(min_length: 20, max_length: 30) }
    user_id                       { Faker::Number.non_zero_digit }
    item_id                       { Faker::Number.non_zero_digit }
  end
end