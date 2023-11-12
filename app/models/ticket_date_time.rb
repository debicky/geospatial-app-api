# frozen_string_literal: true

class TicketDateTime < ApplicationRecord
  belongs_to :ticket
  validates :response_due_date_time, presence: true

  def formatted_response_due_date_time
    response_due_date_time&.strftime('%Y-%m-%d %H:%M:%S')
  end
end
