# frozen_string_literal: true

class PrimaryServiceAreaCode < ApplicationRecord
  belongs_to :service_area
  # ... validations ...
end
