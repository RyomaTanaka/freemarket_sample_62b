FactoryBot.define do

  factory :item do
    name              {"sample"}
    price             {"300"}
    body              {"サンプル"}
    status            {"2"}
    shipping_id          {"1"}
    shipping
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end