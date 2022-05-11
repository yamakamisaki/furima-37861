FactoryBot.define do
  factory :buyer_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { 'A市' }
    home_address     { 'B番地２' }
    building_name    { 'マンション１号室' }
    telephone_number { '1901234567' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
