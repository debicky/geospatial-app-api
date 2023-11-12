# frozen_string_literal: true

FactoryBot.define do
  factory :ticket_date_time do
    association :ticket

    response_due_date_time { DateTime.current }
  end
end
