# frozen_string_literal: true

class PrimaryServiceAreaCode < ApplicationRecord
  belongs_to :service_area

  validates :sa_code, presence: true
end
