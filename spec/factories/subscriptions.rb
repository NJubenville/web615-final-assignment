FactoryBot.define do
  factory :subscription, class: Subscription do
    title { "MyString" }
    publication
    user
  end
end

