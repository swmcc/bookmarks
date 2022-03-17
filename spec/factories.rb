# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    title { Faker::Company.name } 
    page { Faker::Internet.url }
    active { true }
  end
end
