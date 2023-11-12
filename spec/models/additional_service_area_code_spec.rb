# frozen_string_literal: true

RSpec.describe AdditionalServiceAreaCode, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:service_area) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:additional_service_area_code)).to be_valid
    end

    it 'is invalid with a blank sa_code array' do
      additional_code = build(:additional_service_area_code, sa_code: [])
      expect(additional_code).not_to be_valid
      expect(additional_code.errors[:sa_code]).to include('must be a non-empty array of codes')
    end

    it 'is invalid with a nil sa_code' do
      additional_code = build(:additional_service_area_code, sa_code: nil)
      expect(additional_code).not_to be_valid
      expect(additional_code.errors[:sa_code]).to include('must be a non-empty array of codes')
    end

    it 'is invalid with a non-array sa_code' do
      additional_code = build(:additional_service_area_code, sa_code: 'ZZL01')
      expect(additional_code).not_to be_valid
      expect(additional_code.errors[:sa_code]).to include('must be a non-empty array of codes')
    end
  end
end
