# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  has_one :service_area, dependent: :destroy

  validates :request_number, presence: true
  validates :sequence_number, presence: true
  validates :request_type, presence: true
  validates :request_action, presence: true
  validates :response_due_date_time, presence: true
  validates :primary_service_area_code, presence: true
  validates :additional_service_area_codes, presence: true
  validates :well_known_text, presence: true
end
