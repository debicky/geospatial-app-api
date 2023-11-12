# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  has_one :digsite_info, dependent: :destroy
  has_one :ticket_date_time, dependent: :destroy
  has_one :service_area, dependent: :destroy

  validates :request_number, presence: true
  validates :sequence_number, presence: true
  validates :request_type, presence: true
  validates :request_action, presence: true
end
