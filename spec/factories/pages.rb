FactoryBot.define do
  factory :page do
    sequence(:name) { |n| "name#{n}" }
    sequence(:title) { |n| "title#{n}" }
    sequence(:text) { |n| "text#{n}" }
  end
end
