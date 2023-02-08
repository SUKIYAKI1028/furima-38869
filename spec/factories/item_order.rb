FactoryBot.define do
  factory :item_order do
    postal_code                   { '123-4567' }
    prefecture_id                 { 3 }
    city                          { 'テスト市テスト区テスト町' }
    block                         { '1-1-1' }
    building                      { 'ダミービル' }
    telephone_number              { '09000000000' }
    token                         { 'tok_abcdefghijk00000000000000000' }
  end
end
