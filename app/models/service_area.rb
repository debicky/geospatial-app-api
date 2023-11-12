# frozen_string_literal: true

class ServiceArea < ApplicationRecord
  belongs_to :ticket
  has_one :primary_service_area_code, dependent: :destroy
  has_one :additional_service_area_code, dependent: :destroy
end
