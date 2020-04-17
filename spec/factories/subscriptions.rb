# frozen_string_literal: true

FactoryBot.define do
  factory :subscription, class: Subscription do
    title { 'MyString' }
    publication
  end
end
