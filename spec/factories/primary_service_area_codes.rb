# frozen_string_literal: true

FactoryBot.define do
  factory :primary_service_area_code do
    association :service_area
    sa_code { Faker::Alphanumeric.alpha(number: 4) }
  end
end
