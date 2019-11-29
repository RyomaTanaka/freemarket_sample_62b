FactoryBot.define do


  factory :image do
    item
    image {File.open("#{Rails.root}/public/test.jpg")}
  end
end
