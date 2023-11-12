# frozen_string_literal: true

RSpec.describe PrimaryServiceAreaCode, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:service_area) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:primary_service_area_code)).to be_valid
    end

    it 'is invalid without a primary_service_area_code' do
      ticket = build(:primary_service_area_code, sa_code: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:sa_code]).to include("can't be blank")
    end
  end
end
