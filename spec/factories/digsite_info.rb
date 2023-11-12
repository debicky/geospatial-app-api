# frozen_string_literal: true

FactoryBot.define do
  factory :digsite_info do
    association :ticket

    well_known_text do
      central_lat = Faker::Address.latitude
      central_lon = Faker::Address.longitude
      radius = 1

      PolygonGenerator.generate_polygon_around_point(central_lat, central_lon, radius)
    end
  end
end
