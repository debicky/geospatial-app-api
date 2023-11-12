# frozen_string_literal: true

class DigsiteInfo < ApplicationRecord
  belongs_to :ticket

  validates :well_known_text, presence: true
end
