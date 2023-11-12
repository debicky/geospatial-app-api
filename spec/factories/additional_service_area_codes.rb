# frozen_string_literal: true

FactoryBot.define do
  factory :additional_service_area_code do
    association :service_area
    sa_code { Array.new(3) { Faker::Alphanumeric.alpha(number: 4) } }
  end
end
