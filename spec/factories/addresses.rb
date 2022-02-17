FactoryBot.define do
  factory :address do
    post_code           { 123-4567 }
    shipping_area_id    { 2 }
    municipalities      { "横浜市緑区" }
    house_number        { "青山1-1-1" }
    building            { "柳ビル" }
    telephone_number    {  }
    association :order
  end
end

