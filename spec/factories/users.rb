FactoryBot.define do
  factory :user, class: User do
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

  factory :another_user, class: User do 
    nickname                    {"kaneko"}
    sequence(:email)            {Faker::Internet.email}
    password                    {"01200417"}
    first_name                  {"カネコ"}
    family_name                 {"スグル"}
    first_name_ruby             {"カネコ"}
    family_name_ruby            {"スグル"}
    birth_year                  {"1995"}
    birth_month                 {"11"}
    birth_day                   {"2"}
  end
end