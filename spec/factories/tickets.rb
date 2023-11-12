# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { Faker::Number.unique.number(digits: 10).to_s }
    sequence_number { Faker::Number.unique.number(digits: 5).to_s }
    request_type { 'Normal' }
    request_action { 'New' }
  end
end
