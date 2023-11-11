# frozen_string_literal: true

require 'factory_bot_rails'
require_relative '../spec/support/polygon_generator'

Ticket.destroy_all
Excavator.destroy_all

9.times do
  FactoryBot.create(:ticket, :with_excavator)
end

puts 'Created 3 Tickets with associated Excavators.'
