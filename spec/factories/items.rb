FactoryBot.define do
  factory :item do
    image                { Faker::Name.initials(number: 2) }
    name                   { Faker::Name.initials(number: 2) }
    info                { "test" }
    category_id   { 2 }
    state_id              { 2 }
    delivery_charge_id               { 2 }
    shipping_area_id         { 2 }
    shipping_day_id          { 2 }
    price                { Faker::Internet.password(min_length: 6) }
  end
end
