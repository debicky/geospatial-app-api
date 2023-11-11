# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { Faker::Number.unique.number(digits: 10).to_s }
    sequence_number { Faker::Number.unique.number(digits: 5).to_s }
    request_type { 'Normal' }
    request_action { 'New' }
    response_due_date_time { DateTime.current }
    primary_service_area_code { Faker::Alphanumeric.alpha(number: 6) }
    additional_service_area_codes { Array.new(3) { Faker::Alphanumeric.alpha(number: 6) } }
    well_known_text do
      central_lat = Faker::Address.latitude
      central_lon = Faker::Address.longitude
      radius = 1

      PolygonGenerator.generate_polygon_around_point(central_lat, central_lon, radius)
    end

    trait :with_excavator do
      after(:create) do |ticket|
        create(:excavator, ticket:)
      end
    end
  end
end
