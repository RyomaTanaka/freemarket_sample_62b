FactoryBot.define do
  factory :address do
    user
    user_name                 {"abe"}
    user_name_ruby            {"カカ"}
    prefecture                {"0000000"}
    city                      {"こんばんは"}
    house_number              {"こんばんは"}
    post_number               {"0000000"}
  end
end