FactoryBot.define do

  factory :image do
    url {"sample.jpg"}
    item_id {1}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end