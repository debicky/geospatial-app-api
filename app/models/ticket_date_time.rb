# frozen_string_literal: true

class TicketDateTime < ApplicationRecord
  belongs_to :ticket
  validates :response_due_date_time, presence: true
end
