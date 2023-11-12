# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    association :ticket
    company_name { Faker::Company.name }
    address { Faker::Address.full_address }
    crew_on_site { Faker::Boolean.boolean }
  end
end
