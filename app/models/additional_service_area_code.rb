# frozen_string_literal: true

class AdditionalServiceAreaCode < ApplicationRecord
  belongs_to :service_area

  validate :sa_code_must_be_present_and_array

  private

  def sa_code_must_be_present_and_array
    return if sa_code.present? && sa_code.is_a?(Array) && sa_code.none?(&:blank?)

    errors.add(:sa_code, 'must be a non-empty array of codes')
  end
end
