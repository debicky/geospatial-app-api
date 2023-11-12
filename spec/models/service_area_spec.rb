# frozen_string_literal: true

RSpec.describe ServiceArea, type: :model do
  subject { build(:service_area) }

  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
    it { is_expected.to have_one(:primary_service_area_code).dependent(:destroy) }
    it { is_expected.to have_one(:additional_service_area_code).dependent(:destroy) }
  end
end
