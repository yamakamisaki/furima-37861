FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '一郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'イチロウ' }
    birthday              { '2003/07/26' }
  end
end
