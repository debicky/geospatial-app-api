# frozen_string_literal: true

class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :company_name, presence: true
  validates :address, presence: true
  validates :crew_on_site, inclusion: { in: [true, false] }
end
