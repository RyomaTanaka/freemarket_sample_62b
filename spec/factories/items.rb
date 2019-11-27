FactoryBot.define do
  
  factory :item do
    user                           {}
    name                           {"aaa"}
    body                           {"aaaa"}
    price                          {1111}
    status                         {1}
    order_status                   {1}
    shipping_method                {"らくらくメルカリ便"}
    cost_burden                    {"送料込み"}
    period_before_shipping         {"1〜2日で発送"}
    prefecture_id                  {1}
  end
end