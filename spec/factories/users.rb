FactoryBot.define do


  factory :user do
    nickname            {Faker::Name.last_name}
    email               {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    first_name          {"aaa"}
    family_name         {"aaa"}
    first_name_ruby     {"カナ"}
    family_name_ruby    {"カナ"}
    birth_year          {1992}
    birth_month         {01}
    birth_day           {01}
  end
end
