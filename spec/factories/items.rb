FactoryBot.define do
  factory :item do
    title          {'テスト'}
    text           {Faker::JapaneseMedia::StudioGhibli}
    category_id    {2}
    condition_id   {2}
    shipping_fee_id{2}
    prefecture_id  {2}
    send_day_id    {2}
    price          {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
