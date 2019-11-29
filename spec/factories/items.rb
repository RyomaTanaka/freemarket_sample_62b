FactoryBot.define do
  factory :item, class: Item do
    name                   {"sample"}
    body                   {"00000000"}
    price                  {"40000"}
    status                 {1}
    order_status           {"1"}
    shipping_method        {"未定"}
    prefecture_id          {5}
    cost_burden            {"1"}
    period_before_shipping {"1"}
    created_at             { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
  factory :another_item, class: Item do
    name                   {"sample2"}
    body                   {"00000022"}
    price                  {"30000"}
    status                 {1}
    order_status           {"1"}
    shipping_method        {"未定"}
    prefecture_id          {5}
    cost_burden            {"1"}
    period_before_shipping {"1"}
    created_at             { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end