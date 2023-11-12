# frozen_string_literal: true

RSpec.describe Excavator, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:excavator)).to be_valid
    end

    it 'is invalid without a company_name' do
      excavator = build(:excavator, company_name: nil)
      expect(excavator).not_to be_valid
      expect(excavator.errors[:company_name]).to include("can't be blank")
    end

    it 'is invalid without an address' do
      excavator = build(:excavator, address: nil)
      expect(excavator).not_to be_valid
      expect(excavator.errors[:address]).to include("can't be blank")
    end

    it 'is invalid with an incorrect crew_on_site value' do
      excavator = build(:excavator, crew_on_site: nil)
      expect(excavator).not_to be_valid
      expect(excavator.errors[:crew_on_site]).to include('is not included in the list')
    end
  end
end
