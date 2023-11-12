# frozen_string_literal: true

FactoryBot.define do
  factory :service_area do
    association :ticket

    after(:create) do |service_area|
      create(:primary_service_area_code, service_area:)
      create(:additional_service_area_code, service_area:)
    end
  end
end
