FactoryBot.define do


  factory :item do
    name                           {"aaa"}
    body                           {"aaaa"}
    price                          {1111}
    status                         {1}
    order_status                   {1}
    shipping_method                {"らくらくメルカリ便"}
    cost_burden                    {"送料込み"}
    period_before_shipping         {"1〜2日で発送"}
    prefecture_id                  {1}
    created_at             { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
    image
  end
end

#   factory :item do
#     name                   {"sample"}
#     body                   {"00000000"}
#     price                  {"40000"}
#     status                 {1}
#     order_status           {"1"}
#     prefecture_id          {5}
#     cost_burden            {"1"}
#     period_before_shipping {"1"}
#     created_at             { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
#     user
#   end
# end
