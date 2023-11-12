# frozen_string_literal: true

require 'factory_bot_rails'
require_relative '../spec/support/polygon_generator'

Ticket.destroy_all

9.times do
  ticket = FactoryBot.create(:ticket)
  FactoryBot.create(:excavator, ticket:)
  FactoryBot.create(:ticket_date_time, ticket:)
  service_area = FactoryBot.create(:service_area, ticket:)
  FactoryBot.create(:primary_service_area_code, service_area:)
  FactoryBot.create(:additional_service_area_code, service_area:)
  FactoryBot.create(:digsite_info, ticket:)
end

puts 'Created 9 Tickets with associated Excavators.'
