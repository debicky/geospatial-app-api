# frozen_string_literal: true

require 'factory_bot_rails'

Ticket.destroy_all
Excavator.destroy_all

3.times do
  FactoryBot.create(:ticket, :with_excavator)
end

puts "Created 3 Tickets with associated Excavators."