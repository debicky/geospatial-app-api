# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    company_name { Faker::Company.name }
    address { Faker::Address.full_address }
    crew_on_site { Faker::Boolean.boolean }
    association :ticket
  end
end
