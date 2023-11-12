# frozen_string_literal: true

module TicketsHelper
  def crew_on_site_present?(excavator)
    excavator.crew_on_site ? 'Yes' : 'No'
  end

  def formatted_response_due_date_time(response_due_date_time)
    response_due_date_time&.strftime('%Y-%m-%d %H:%M:%S')
  end
end
