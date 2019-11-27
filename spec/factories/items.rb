FactoryBot.define do

  factory :item do
    
    name                    {"kawa"}
    email                   {"kkk@gmail.com"}
    password                {"00000000"}
    status                  {0}
    order_status            {0}
    prefecture              {0}
    cost_burden             {0}
    period_before_shipping  {0}
    user_id                 {1}
  end

end