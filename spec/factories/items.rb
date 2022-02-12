FactoryBot.define do
  factory :item do
    name                   { Faker::Name.initials(number: 2) }
    info                   { Faker::Lorem.sentence }
    category_id            { 2 }
    state_id               { 2 }
    delivery_charge_id     { 2 }
    shipping_area_id       { 2 }
    shipping_day_id        { 2 }
    price                  { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
