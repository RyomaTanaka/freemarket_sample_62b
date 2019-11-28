FactoryBot.define do
  factory :user do
    nickname                    {"abe"}
    sequence(:email)            {Faker::Internet.email}
    password                    {"00000000"}
    first_name                  {"テスト"}
    family_name                 {"太郎"}
    first_name_ruby             {"テスト"}
    family_name_ruby            {"タロウ"}
    birth_year                  {"2000"}
    birth_month                 {"10"}
    birth_day                   {"2"}
  end
end
