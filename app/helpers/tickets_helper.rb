# frozen_string_literal: true

module TicketsHelper
  def crew_on_site_present?(excavator)
    excavator.crew_on_site ? 'Yes' : 'No'
  end
end
